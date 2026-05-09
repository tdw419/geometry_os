; DESCRIPTION: Renders a magenta line between points (392, 32) and (433, 235).
; PLAN: r0=392(x1), r1=32(y1), r2=433(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 32
LDI r2, 433
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
