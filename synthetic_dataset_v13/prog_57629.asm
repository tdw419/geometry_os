; DESCRIPTION: Renders a blue line between points (393, 176) and (394, 195).
; PLAN: r0=393(x1), r1=176(y1), r2=394(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 176
LDI r2, 394
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
