; DESCRIPTION: Places a green circle of radius 48 at center (152, 126).
; PLAN: r0=152(x), r1=126(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 126
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
