; DESCRIPTION: Places a blue line segment connecting (367, 228) to (213, 218).
; PLAN: r0=367(x1), r1=228(y1), r2=213(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 228
LDI r2, 213
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
