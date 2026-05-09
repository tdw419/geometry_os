; DESCRIPTION: Composite: Renders a yellow disk with center (399, 185) and radius 57 then Draws a black line from (226, 208) to (505, 247) then Places a cyan 13x77 rectangle at position (220, 118).
; PLAN: r0=399(x), r1=185(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x1), r6=208(y1), r7=505(x2), r8=247(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=220(x), r11=118(y), r12=13(width), r13=77(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 185
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 208
LDI r7, 505
LDI r8, 247
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 118
LDI r12, 13
LDI r13, 77
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
