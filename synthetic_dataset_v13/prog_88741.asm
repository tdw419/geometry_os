; DESCRIPTION: Places a yellow circle of radius 42 at center (174, 152).
; PLAN: r0=174(x), r1=152(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 152
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
