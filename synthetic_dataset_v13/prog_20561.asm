; DESCRIPTION: Renders a cyan line between points (134, 195) and (140, 84).
; PLAN: r0=134(x1), r1=195(y1), r2=140(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 195
LDI r2, 140
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
