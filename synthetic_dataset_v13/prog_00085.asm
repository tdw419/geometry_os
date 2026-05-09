; DESCRIPTION: Composite: Draws a red line from (409, 72) to (1, 195) then Draws a blue circle centered at (207, 79) with radius 79.
; PLAN: r0=409(x1), r1=72(y1), r2=1(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=79(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 409
LDI r1, 72
LDI r2, 1
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 79
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
