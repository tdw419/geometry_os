; DESCRIPTION: Composite: Places a blue dot at position (89, 210) then Renders a blue box of size 64x79 starting at (319, 24) then Renders a cyan line between points (350, 221) and (505, 227).
; PLAN: r0=89(x), r1=210(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=24(y), r7=64(width), r8=79(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=350(x1), r11=221(y1), r12=505(x2), r13=227(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 210
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 24
LDI r7, 64
LDI r8, 79
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 221
LDI r12, 505
LDI r13, 227
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
