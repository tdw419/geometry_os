; DESCRIPTION: Composite: Draws a red circle centered at (212, 125) with radius 31 then Draws a magenta line from (120, 231) to (307, 40).
; PLAN: r0=212(x), r1=125(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x1), r6=231(y1), r7=307(x2), r8=40(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 125
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 231
LDI r7, 307
LDI r8, 40
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
