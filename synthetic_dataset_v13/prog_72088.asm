; DESCRIPTION: Renders a cyan line between points (505, 97) and (50, 159).
; PLAN: r0=505(x1), r1=97(y1), r2=50(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 97
LDI r2, 50
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
