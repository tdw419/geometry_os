; DESCRIPTION: Composite: Places a magenta 25x53 rectangle at position (309, 160) then Places a red line segment connecting (321, 161) to (453, 167).
; PLAN: r0=309(x), r1=160(y), r2=25(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=161(y1), r7=453(x2), r8=167(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 160
LDI r2, 25
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 161
LDI r7, 453
LDI r8, 167
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
