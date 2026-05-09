; DESCRIPTION: Draws a blue line from (228, 29) to (79, 64).
; PLAN: r0=228(x1), r1=29(y1), r2=79(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 29
LDI r2, 79
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
