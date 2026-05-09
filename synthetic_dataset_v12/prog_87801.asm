; DESCRIPTION: Places a magenta line segment connecting (470, 228) to (385, 117).
; PLAN: r0=470(x1), r1=228(y1), r2=385(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 228
LDI r2, 385
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
