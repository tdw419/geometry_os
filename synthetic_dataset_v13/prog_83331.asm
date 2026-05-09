; DESCRIPTION: Draws a yellow line from (285, 120) to (506, 192).
; PLAN: r0=285(x1), r1=120(y1), r2=506(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 120
LDI r2, 506
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
