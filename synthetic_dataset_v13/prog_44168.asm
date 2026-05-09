; DESCRIPTION: Places a magenta line segment connecting (254, 109) to (27, 228).
; PLAN: r0=254(x1), r1=109(y1), r2=27(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 109
LDI r2, 27
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
