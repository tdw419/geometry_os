; DESCRIPTION: Composite: Draws a blue line from (122, 231) to (405, 106) then Places a magenta dot at position (83, 153).
; PLAN: r0=122(x1), r1=231(y1), r2=405(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=153(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 122
LDI r1, 231
LDI r2, 405
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 153
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
