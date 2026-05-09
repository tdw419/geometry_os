; DESCRIPTION: Renders a magenta line between points (218, 191) and (385, 173).
; PLAN: r0=218(x1), r1=191(y1), r2=385(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 191
LDI r2, 385
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
