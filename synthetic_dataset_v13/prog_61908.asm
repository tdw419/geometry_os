; DESCRIPTION: Composite: Places a yellow line segment connecting (348, 255) to (234, 2) then Renders a black box of size 111x109 starting at (312, 74).
; PLAN: r0=348(x1), r1=255(y1), r2=234(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=74(y), r7=111(width), r8=109(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 255
LDI r2, 234
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 74
LDI r7, 111
LDI r8, 109
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
