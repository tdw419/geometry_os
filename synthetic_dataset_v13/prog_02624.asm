; DESCRIPTION: Places a orange circle of radius 16 at center (260, 30).
; PLAN: r0=260(x), r1=30(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 30
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
