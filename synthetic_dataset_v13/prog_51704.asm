; DESCRIPTION: Composite: Places a green line segment connecting (154, 182) to (193, 161) then Draws a cyan rectangle at (266, 177) with width 99 and height 35.
; PLAN: r0=154(x1), r1=182(y1), r2=193(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=177(y), r7=99(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 182
LDI r2, 193
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 177
LDI r7, 99
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
