; DESCRIPTION: Renders a magenta line between points (415, 237) and (294, 108).
; PLAN: r0=415(x1), r1=237(y1), r2=294(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 237
LDI r2, 294
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
