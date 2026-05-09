; DESCRIPTION: Renders a cyan line between points (30, 160) and (288, 13).
; PLAN: r0=30(x1), r1=160(y1), r2=288(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 160
LDI r2, 288
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
