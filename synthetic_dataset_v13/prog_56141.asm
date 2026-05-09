; DESCRIPTION: Places a orange circle of radius 64 at center (278, 174).
; PLAN: r0=278(x), r1=174(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 174
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
