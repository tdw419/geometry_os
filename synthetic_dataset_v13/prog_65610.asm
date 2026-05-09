; DESCRIPTION: Places a yellow circle of radius 12 at center (237, 236).
; PLAN: r0=237(x), r1=236(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 236
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
