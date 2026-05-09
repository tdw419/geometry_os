; DESCRIPTION: Composite: Draws a black line from (462, 133) to (154, 246) then Renders a cyan box of size 111x63 starting at (363, 104).
; PLAN: r0=462(x1), r1=133(y1), r2=154(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=104(y), r7=111(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 133
LDI r2, 154
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 104
LDI r7, 111
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
