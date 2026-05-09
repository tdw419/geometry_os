; DESCRIPTION: Renders a cyan line between points (388, 153) and (105, 219).
; PLAN: r0=388(x1), r1=153(y1), r2=105(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 153
LDI r2, 105
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
