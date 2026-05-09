; DESCRIPTION: Places a magenta line segment connecting (175, 173) to (509, 166).
; PLAN: r0=175(x1), r1=173(y1), r2=509(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 173
LDI r2, 509
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
