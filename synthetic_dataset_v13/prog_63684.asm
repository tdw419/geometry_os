; DESCRIPTION: Composite: Draws a green line from (15, 58) to (379, 113) then Places a magenta dot at position (320, 140).
; PLAN: r0=15(x1), r1=58(y1), r2=379(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=140(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 15
LDI r1, 58
LDI r2, 379
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 140
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
