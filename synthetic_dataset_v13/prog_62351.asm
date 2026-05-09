; DESCRIPTION: Places a magenta line segment connecting (415, 226) to (354, 254).
; PLAN: r0=415(x1), r1=226(y1), r2=354(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 226
LDI r2, 354
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
