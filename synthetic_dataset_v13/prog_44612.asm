; DESCRIPTION: Composite: Draws a green line from (258, 169) to (169, 149) then Places a magenta dot at position (239, 104).
; PLAN: r0=258(x1), r1=169(y1), r2=169(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=104(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 169
LDI r2, 169
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 104
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
