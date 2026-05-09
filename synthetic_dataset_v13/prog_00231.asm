; DESCRIPTION: Places a red circle of radius 71 at center (75, 180).
; PLAN: r0=75(x), r1=180(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 180
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
