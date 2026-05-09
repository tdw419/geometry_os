; DESCRIPTION: Renders a cyan line between points (10, 253) and (237, 205).
; PLAN: r0=10(x1), r1=253(y1), r2=237(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 253
LDI r2, 237
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
