; DESCRIPTION: Renders a cyan line between points (365, 97) and (171, 66).
; PLAN: r0=365(x1), r1=97(y1), r2=171(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 97
LDI r2, 171
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
