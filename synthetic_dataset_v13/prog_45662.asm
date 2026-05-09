; DESCRIPTION: Renders a magenta line between points (282, 149) and (436, 228).
; PLAN: r0=282(x1), r1=149(y1), r2=436(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 149
LDI r2, 436
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
