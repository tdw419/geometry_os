; DESCRIPTION: Composite: Renders a cyan line between points (438, 219) and (348, 228) then Renders a white box of size 112x48 starting at (314, 1).
; PLAN: r0=438(x1), r1=219(y1), r2=348(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=1(y), r7=112(width), r8=48(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 219
LDI r2, 348
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 1
LDI r7, 112
LDI r8, 48
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
