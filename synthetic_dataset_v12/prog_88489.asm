; DESCRIPTION: Composite: Draws a magenta line from (468, 128) to (106, 25) then Renders a white box of size 60x120 starting at (180, 128).
; PLAN: r0=468(x1), r1=128(y1), r2=106(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=128(y), r7=60(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 128
LDI r2, 106
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 128
LDI r7, 60
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
