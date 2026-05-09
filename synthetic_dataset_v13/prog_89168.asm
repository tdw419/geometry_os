; DESCRIPTION: Renders a cyan line between points (11, 195) and (220, 11).
; PLAN: r0=11(x1), r1=195(y1), r2=220(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 195
LDI r2, 220
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
