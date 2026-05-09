; DESCRIPTION: Renders a cyan line between points (362, 47) and (237, 245).
; PLAN: r0=362(x1), r1=47(y1), r2=237(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 47
LDI r2, 237
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
