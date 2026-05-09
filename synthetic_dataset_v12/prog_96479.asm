; DESCRIPTION: Renders a cyan line between points (51, 147) and (363, 213).
; PLAN: r0=51(x1), r1=147(y1), r2=363(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 147
LDI r2, 363
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
