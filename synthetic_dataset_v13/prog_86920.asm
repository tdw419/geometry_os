; DESCRIPTION: Composite: Draws a blue line from (371, 231) to (46, 156) then Places a white dot at position (241, 151).
; PLAN: r0=371(x1), r1=231(y1), r2=46(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=151(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 371
LDI r1, 231
LDI r2, 46
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 151
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
