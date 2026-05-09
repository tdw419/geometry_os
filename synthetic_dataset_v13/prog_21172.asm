; DESCRIPTION: Renders a cyan line between points (195, 30) and (28, 212).
; PLAN: r0=195(x1), r1=30(y1), r2=28(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 30
LDI r2, 28
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
