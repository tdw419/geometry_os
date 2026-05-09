; DESCRIPTION: Composite: Places a white line segment connecting (299, 123) to (43, 247) then Renders a black box of size 21x18 starting at (391, 78).
; PLAN: r0=299(x1), r1=123(y1), r2=43(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=78(y), r7=21(width), r8=18(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 123
LDI r2, 43
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 78
LDI r7, 21
LDI r8, 18
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
