; DESCRIPTION: Draws a black line from (502, 20) to (478, 182).
; PLAN: r0=502(x1), r1=20(y1), r2=478(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 20
LDI r2, 478
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
