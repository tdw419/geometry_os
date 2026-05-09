; DESCRIPTION: Draws a cyan line from (357, 103) to (235, 192).
; PLAN: r0=357(x1), r1=103(y1), r2=235(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 103
LDI r2, 235
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
