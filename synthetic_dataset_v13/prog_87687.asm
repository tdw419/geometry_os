; DESCRIPTION: Renders a cyan line between points (185, 96) and (288, 172).
; PLAN: r0=185(x1), r1=96(y1), r2=288(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 96
LDI r2, 288
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
