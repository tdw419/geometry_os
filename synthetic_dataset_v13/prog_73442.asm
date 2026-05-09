; DESCRIPTION: Composite: Draws a cyan line from (198, 139) to (75, 156) then Renders a blue box of size 80x76 starting at (303, 139).
; PLAN: r0=198(x1), r1=139(y1), r2=75(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=139(y), r7=80(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 139
LDI r2, 75
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 139
LDI r7, 80
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
