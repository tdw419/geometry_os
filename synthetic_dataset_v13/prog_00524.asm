; DESCRIPTION: Places a blue line segment connecting (14, 180) to (368, 228).
; PLAN: r0=14(x1), r1=180(y1), r2=368(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 180
LDI r2, 368
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
