; DESCRIPTION: Composite: Places a orange line segment connecting (490, 183) to (470, 228) then Places a red dot at position (93, 132) then Renders a red box of size 19x16 starting at (310, 210).
; PLAN: r0=490(x1), r1=183(y1), r2=470(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=132(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=310(x), r11=210(y), r12=19(width), r13=16(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 183
LDI r2, 470
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 132
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 310
LDI r11, 210
LDI r12, 19
LDI r13, 16
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
