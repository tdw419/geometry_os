; DESCRIPTION: Composite: Draws a white line from (281, 250) to (297, 119) then Sets a single magenta pixel at (479, 70).
; PLAN: r0=281(x1), r1=250(y1), r2=297(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=479(x), r6=70(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 250
LDI r2, 297
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 70
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
