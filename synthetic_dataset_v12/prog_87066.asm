; DESCRIPTION: Draws a magenta line from (108, 209) to (235, 42).
; PLAN: r0=108(x1), r1=209(y1), r2=235(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 209
LDI r2, 235
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
