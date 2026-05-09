; DESCRIPTION: Composite: Renders a white box of size 32x78 starting at (433, 79) then Places a magenta line segment connecting (461, 201) to (146, 54).
; PLAN: r0=433(x), r1=79(y), r2=32(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x1), r6=201(y1), r7=146(x2), r8=54(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 79
LDI r2, 32
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 201
LDI r7, 146
LDI r8, 54
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
