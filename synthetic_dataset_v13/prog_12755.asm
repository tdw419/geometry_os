; DESCRIPTION: Places a yellow line segment connecting (32, 247) to (215, 141).
; PLAN: r0=32(x1), r1=247(y1), r2=215(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 247
LDI r2, 215
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
