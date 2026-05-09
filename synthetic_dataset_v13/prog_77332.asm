; DESCRIPTION: Draws a cyan line from (124, 88) to (454, 219).
; PLAN: r0=124(x1), r1=88(y1), r2=454(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 88
LDI r2, 454
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
