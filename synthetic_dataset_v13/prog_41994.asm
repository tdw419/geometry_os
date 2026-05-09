; DESCRIPTION: Places a blue line segment connecting (195, 228) to (187, 196).
; PLAN: r0=195(x1), r1=228(y1), r2=187(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 228
LDI r2, 187
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
