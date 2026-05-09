; DESCRIPTION: Renders a cyan line between points (6, 229) and (417, 221).
; PLAN: r0=6(x1), r1=229(y1), r2=417(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 229
LDI r2, 417
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
