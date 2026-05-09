; DESCRIPTION: Places a magenta line segment connecting (449, 228) to (487, 2).
; PLAN: r0=449(x1), r1=228(y1), r2=487(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 228
LDI r2, 487
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
