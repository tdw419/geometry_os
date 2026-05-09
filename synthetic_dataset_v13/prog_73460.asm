; DESCRIPTION: Renders a cyan line between points (262, 179) and (204, 211).
; PLAN: r0=262(x1), r1=179(y1), r2=204(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 179
LDI r2, 204
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
