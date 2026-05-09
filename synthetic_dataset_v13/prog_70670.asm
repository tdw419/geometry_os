; DESCRIPTION: Composite: Draws a green line from (306, 143) to (267, 206) then Creates a magenta rectangular region at (386, 89) spanning 117 by 24 pixels.
; PLAN: r0=306(x1), r1=143(y1), r2=267(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=89(y), r7=117(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 143
LDI r2, 267
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 89
LDI r7, 117
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
