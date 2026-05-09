; DESCRIPTION: Places a magenta line segment connecting (466, 173) to (346, 194).
; PLAN: r0=466(x1), r1=173(y1), r2=346(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 173
LDI r2, 346
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
