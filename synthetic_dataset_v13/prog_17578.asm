; DESCRIPTION: Places a cyan line segment connecting (198, 188) to (235, 47).
; PLAN: r0=198(x1), r1=188(y1), r2=235(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 188
LDI r2, 235
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
