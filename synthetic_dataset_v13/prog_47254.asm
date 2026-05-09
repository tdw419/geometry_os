; DESCRIPTION: Composite: Places a cyan line segment connecting (336, 197) to (47, 231) then Places a purple dot at position (220, 23).
; PLAN: r0=336(x1), r1=197(y1), r2=47(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=23(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 197
LDI r2, 47
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 23
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
