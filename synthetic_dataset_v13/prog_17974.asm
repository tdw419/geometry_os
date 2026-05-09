; DESCRIPTION: Composite: Places a magenta line segment connecting (215, 141) to (502, 203) then Creates a orange circular shape at (439, 157) with radius 72.
; PLAN: r0=215(x1), r1=141(y1), r2=502(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=157(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 141
LDI r2, 502
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 157
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
