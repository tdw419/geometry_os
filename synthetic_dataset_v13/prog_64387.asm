; DESCRIPTION: Draws a black line from (506, 129) to (461, 192).
; PLAN: r0=506(x1), r1=129(y1), r2=461(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 129
LDI r2, 461
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
