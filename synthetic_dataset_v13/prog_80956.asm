; DESCRIPTION: Composite: Renders a green box of size 79x48 starting at (105, 75) then Places a cyan line segment connecting (156, 63) to (338, 149).
; PLAN: r0=105(x), r1=75(y), r2=79(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x1), r6=63(y1), r7=338(x2), r8=149(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 75
LDI r2, 79
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 63
LDI r7, 338
LDI r8, 149
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
