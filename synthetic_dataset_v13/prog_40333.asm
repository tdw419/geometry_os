; DESCRIPTION: Places a orange circle of radius 21 at center (151, 215).
; PLAN: r0=151(x), r1=215(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 215
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
