; DESCRIPTION: Composite: Renders a red box of size 103x69 starting at (126, 67) then Renders a red line between points (484, 56) and (228, 170) then Sets a single white pixel at (496, 148).
; PLAN: r0=126(x), r1=67(y), r2=103(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x1), r6=56(y1), r7=228(x2), r8=170(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=496(x), r11=148(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 126
LDI r1, 67
LDI r2, 103
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 56
LDI r7, 228
LDI r8, 170
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 496
LDI r11, 148
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
