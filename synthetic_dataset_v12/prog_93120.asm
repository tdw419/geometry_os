; DESCRIPTION: Renders a cyan line between points (94, 6) and (465, 81).
; PLAN: r0=94(x1), r1=6(y1), r2=465(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 6
LDI r2, 465
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
