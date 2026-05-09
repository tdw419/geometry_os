; DESCRIPTION: Places a orange circle of radius 10 at center (243, 142).
; PLAN: r0=243(x), r1=142(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 142
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
