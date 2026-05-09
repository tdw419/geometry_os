; DESCRIPTION: Renders a cyan line between points (231, 61) and (98, 38).
; PLAN: r0=231(x1), r1=61(y1), r2=98(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 61
LDI r2, 98
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
