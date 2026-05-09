; DESCRIPTION: Composite: Draws a cyan line from (448, 185) to (95, 163) then Renders a green box of size 42x102 starting at (350, 139).
; PLAN: r0=448(x1), r1=185(y1), r2=95(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=139(y), r7=42(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 185
LDI r2, 95
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 139
LDI r7, 42
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
