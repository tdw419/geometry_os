; DESCRIPTION: Places a yellow line segment connecting (235, 51) to (502, 166).
; PLAN: r0=235(x1), r1=51(y1), r2=502(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 51
LDI r2, 502
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
