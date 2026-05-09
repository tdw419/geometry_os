; DESCRIPTION: Composite: Renders a black box of size 76x10 starting at (229, 158) then Places a purple dot at position (193, 166) then Renders a purple line between points (398, 245) and (317, 100).
; PLAN: r0=229(x), r1=158(y), r2=76(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=166(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=398(x1), r11=245(y1), r12=317(x2), r13=100(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 158
LDI r2, 76
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 166
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 398
LDI r11, 245
LDI r12, 317
LDI r13, 100
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
