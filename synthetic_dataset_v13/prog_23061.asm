; DESCRIPTION: Renders a cyan line between points (470, 195) and (25, 185).
; PLAN: r0=470(x1), r1=195(y1), r2=25(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 195
LDI r2, 25
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
