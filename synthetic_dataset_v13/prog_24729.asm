; DESCRIPTION: Places a orange circle of radius 27 at center (209, 173).
; PLAN: r0=209(x), r1=173(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 173
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
