; DESCRIPTION: Draws a cyan line from (235, 121) to (92, 136).
; PLAN: r0=235(x1), r1=121(y1), r2=92(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 121
LDI r2, 92
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
