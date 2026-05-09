; DESCRIPTION: Composite: Places a black line segment connecting (449, 201) to (295, 19) then Places a cyan dot at position (75, 117).
; PLAN: r0=449(x1), r1=201(y1), r2=295(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=117(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 449
LDI r1, 201
LDI r2, 295
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 117
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
