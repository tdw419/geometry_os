; DESCRIPTION: Renders a cyan line between points (328, 202) and (363, 87).
; PLAN: r0=328(x1), r1=202(y1), r2=363(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 202
LDI r2, 363
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
