; DESCRIPTION: Renders a cyan line between points (237, 246) and (350, 90).
; PLAN: r0=237(x1), r1=246(y1), r2=350(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 246
LDI r2, 350
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
