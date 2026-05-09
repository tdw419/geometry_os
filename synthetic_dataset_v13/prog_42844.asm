; DESCRIPTION: Renders a magenta line between points (338, 157) and (354, 242).
; PLAN: r0=338(x1), r1=157(y1), r2=354(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 157
LDI r2, 354
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
