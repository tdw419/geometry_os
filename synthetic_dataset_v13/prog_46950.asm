; DESCRIPTION: Draws a cyan line from (227, 55) to (36, 28).
; PLAN: r0=227(x1), r1=55(y1), r2=36(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 55
LDI r2, 36
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
