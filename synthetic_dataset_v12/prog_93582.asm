; DESCRIPTION: Places a blue line segment connecting (116, 129) to (494, 239).
; PLAN: r0=116(x1), r1=129(y1), r2=494(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 129
LDI r2, 494
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
