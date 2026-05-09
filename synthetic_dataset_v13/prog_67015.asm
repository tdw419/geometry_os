; DESCRIPTION: Composite: Renders a cyan box of size 91x119 starting at (367, 125) then Places a magenta line segment connecting (94, 203) to (52, 217).
; PLAN: r0=367(x), r1=125(y), r2=91(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x1), r6=203(y1), r7=52(x2), r8=217(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 125
LDI r2, 91
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 203
LDI r7, 52
LDI r8, 217
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
