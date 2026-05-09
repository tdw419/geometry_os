; DESCRIPTION: Composite: Places a yellow dot at position (400, 217) then Draws a cyan rectangle at (68, 32) with width 30 and height 51 then Renders a blue line between points (283, 52) and (446, 233).
; PLAN: r0=400(x), r1=217(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=32(y), r7=30(width), r8=51(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=283(x1), r11=52(y1), r12=446(x2), r13=233(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 217
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 68
LDI r6, 32
LDI r7, 30
LDI r8, 51
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 52
LDI r12, 446
LDI r13, 233
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
