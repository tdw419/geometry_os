; DESCRIPTION: Places a magenta line segment connecting (494, 70) to (239, 221).
; PLAN: r0=494(x1), r1=70(y1), r2=239(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 70
LDI r2, 239
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
