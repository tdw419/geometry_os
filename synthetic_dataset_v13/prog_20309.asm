; DESCRIPTION: Places a orange circle of radius 44 at center (317, 167).
; PLAN: r0=317(x), r1=167(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 167
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
