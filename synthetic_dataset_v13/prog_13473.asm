; DESCRIPTION: Renders a cyan line between points (231, 99) and (486, 86).
; PLAN: r0=231(x1), r1=99(y1), r2=486(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 99
LDI r2, 486
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
