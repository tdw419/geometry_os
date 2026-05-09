; DESCRIPTION: Renders a cyan line between points (441, 148) and (392, 235).
; PLAN: r0=441(x1), r1=148(y1), r2=392(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 148
LDI r2, 392
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
