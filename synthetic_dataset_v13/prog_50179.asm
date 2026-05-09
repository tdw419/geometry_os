; DESCRIPTION: Places a green circle of radius 73 at center (80, 180).
; PLAN: r0=80(x), r1=180(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 180
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
