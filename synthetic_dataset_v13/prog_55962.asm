; DESCRIPTION: Draws a black line from (34, 168) to (471, 154).
; PLAN: r0=34(x1), r1=168(y1), r2=471(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 168
LDI r2, 471
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
