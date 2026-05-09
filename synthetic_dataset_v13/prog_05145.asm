; DESCRIPTION: Places a orange circle of radius 77 at center (176, 173).
; PLAN: r0=176(x), r1=173(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 173
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
