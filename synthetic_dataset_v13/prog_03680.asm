; DESCRIPTION: Places a green circle of radius 15 at center (360, 180).
; PLAN: r0=360(x), r1=180(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 180
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
