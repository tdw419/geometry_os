; DESCRIPTION: Draws a magenta line from (185, 215) to (173, 184).
; PLAN: r0=185(x1), r1=215(y1), r2=173(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 215
LDI r2, 173
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
