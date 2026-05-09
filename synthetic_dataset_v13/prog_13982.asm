; DESCRIPTION: Composite: Places a red line segment connecting (200, 172) to (365, 125) then Renders a yellow box of size 27x13 starting at (325, 50).
; PLAN: r0=200(x1), r1=172(y1), r2=365(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=50(y), r7=27(width), r8=13(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 172
LDI r2, 365
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 50
LDI r7, 27
LDI r8, 13
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
