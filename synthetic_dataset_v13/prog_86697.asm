; DESCRIPTION: Composite: Renders a yellow line between points (349, 124) and (151, 117) then Places a cyan dot at position (326, 172).
; PLAN: r0=349(x1), r1=124(y1), r2=151(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=172(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 349
LDI r1, 124
LDI r2, 151
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 172
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
