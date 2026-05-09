; DESCRIPTION: Composite: Creates a orange rectangular region at (287, 234) spanning 52 by 21 pixels then Places a white dot at position (363, 86) then Renders a yellow line between points (437, 11) and (243, 180).
; PLAN: r0=287(x), r1=234(y), r2=52(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=86(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=437(x1), r11=11(y1), r12=243(x2), r13=180(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 234
LDI r2, 52
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 86
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 437
LDI r11, 11
LDI r12, 243
LDI r13, 180
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
