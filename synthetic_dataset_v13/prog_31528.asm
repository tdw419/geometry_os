; DESCRIPTION: Renders a cyan line between points (388, 30) and (160, 72).
; PLAN: r0=388(x1), r1=30(y1), r2=160(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 30
LDI r2, 160
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
