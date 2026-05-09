; DESCRIPTION: Places a orange circle of radius 60 at center (152, 192).
; PLAN: r0=152(x), r1=192(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 192
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
