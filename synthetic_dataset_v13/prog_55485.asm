; DESCRIPTION: Draws a cyan line from (453, 80) to (19, 38).
; PLAN: r0=453(x1), r1=80(y1), r2=19(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 80
LDI r2, 19
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
