; DESCRIPTION: Renders a cyan line between points (7, 159) and (307, 206).
; PLAN: r0=7(x1), r1=159(y1), r2=307(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 159
LDI r2, 307
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
