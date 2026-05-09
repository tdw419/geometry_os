; DESCRIPTION: Renders a cyan line between points (226, 139) and (331, 195).
; PLAN: r0=226(x1), r1=139(y1), r2=331(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 139
LDI r2, 331
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
