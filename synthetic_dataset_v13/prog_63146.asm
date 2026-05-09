; DESCRIPTION: Places a orange circle of radius 64 at center (236, 180).
; PLAN: r0=236(x), r1=180(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 180
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
