; DESCRIPTION: Places a magenta line segment connecting (391, 205) to (464, 173).
; PLAN: r0=391(x1), r1=205(y1), r2=464(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 205
LDI r2, 464
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
