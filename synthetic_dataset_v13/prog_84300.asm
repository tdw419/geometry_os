; DESCRIPTION: Draws a cyan line from (219, 54) to (453, 72).
; PLAN: r0=219(x1), r1=54(y1), r2=453(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 54
LDI r2, 453
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
