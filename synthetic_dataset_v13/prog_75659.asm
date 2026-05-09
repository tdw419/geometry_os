; DESCRIPTION: Renders a green line between points (468, 195) and (87, 165).
; PLAN: r0=468(x1), r1=195(y1), r2=87(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 195
LDI r2, 87
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
