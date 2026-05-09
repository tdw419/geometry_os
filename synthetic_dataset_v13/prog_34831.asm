; DESCRIPTION: Places a yellow line segment connecting (377, 228) to (19, 228).
; PLAN: r0=377(x1), r1=228(y1), r2=19(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 228
LDI r2, 19
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
