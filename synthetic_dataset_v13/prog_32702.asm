; DESCRIPTION: Composite: Places a blue dot at position (475, 245) then Draws a cyan rectangle at (200, 234) with width 74 and height 16 then Renders a blue line between points (214, 210) and (393, 92).
; PLAN: r0=475(x), r1=245(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=234(y), r7=74(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x1), r11=210(y1), r12=393(x2), r13=92(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 245
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 234
LDI r7, 74
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 210
LDI r12, 393
LDI r13, 92
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
