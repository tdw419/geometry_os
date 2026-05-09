; DESCRIPTION: Renders a magenta line between points (392, 57) and (337, 173).
; PLAN: r0=392(x1), r1=57(y1), r2=337(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 57
LDI r2, 337
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
