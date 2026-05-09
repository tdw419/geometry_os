; DESCRIPTION: Renders a cyan line between points (467, 177) and (185, 14).
; PLAN: r0=467(x1), r1=177(y1), r2=185(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 177
LDI r2, 185
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
