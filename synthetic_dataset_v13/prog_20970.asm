; DESCRIPTION: Composite: Draws a purple line from (437, 248) to (143, 38) then Places a cyan dot at position (360, 213).
; PLAN: r0=437(x1), r1=248(y1), r2=143(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=213(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 248
LDI r2, 143
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 213
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
