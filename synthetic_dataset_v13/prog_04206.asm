; DESCRIPTION: Renders a green line between points (309, 39) and (150, 114).
; PLAN: r0=309(x1), r1=39(y1), r2=150(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 39
LDI r2, 150
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
