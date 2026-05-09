; DESCRIPTION: Composite: Renders a orange disk with center (75, 123) and radius 56 then Places a red line segment connecting (397, 239) to (352, 76).
; PLAN: r0=75(x), r1=123(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x1), r6=239(y1), r7=352(x2), r8=76(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 123
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 239
LDI r7, 352
LDI r8, 76
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
