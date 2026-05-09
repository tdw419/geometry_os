; DESCRIPTION: Renders a yellow line between points (235, 46) and (502, 249).
; PLAN: r0=235(x1), r1=46(y1), r2=502(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 46
LDI r2, 502
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
