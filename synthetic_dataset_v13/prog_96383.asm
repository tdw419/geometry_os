; DESCRIPTION: Composite: Draws a green line from (62, 108) to (337, 86) then Places a purple dot at position (161, 50).
; PLAN: r0=62(x1), r1=108(y1), r2=337(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=50(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 108
LDI r2, 337
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 50
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
