; DESCRIPTION: Composite: Places a purple dot at position (389, 214) then Renders a cyan line between points (128, 81) and (121, 107).
; PLAN: r0=389(x), r1=214(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=128(x1), r6=81(y1), r7=121(x2), r8=107(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 214
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 128
LDI r6, 81
LDI r7, 121
LDI r8, 107
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
