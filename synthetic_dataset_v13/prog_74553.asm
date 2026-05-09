; DESCRIPTION: Composite: Places a cyan dot at position (155, 134) then Places a purple line segment connecting (213, 120) to (377, 27).
; PLAN: r0=155(x), r1=134(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=213(x1), r6=120(y1), r7=377(x2), r8=27(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 134
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 213
LDI r6, 120
LDI r7, 377
LDI r8, 27
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
