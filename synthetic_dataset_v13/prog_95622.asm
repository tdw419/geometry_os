; DESCRIPTION: Places a orange circle of radius 71 at center (173, 174).
; PLAN: r0=173(x), r1=174(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 174
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
