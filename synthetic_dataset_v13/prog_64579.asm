; DESCRIPTION: Places a green circle of radius 46 at center (256, 174).
; PLAN: r0=256(x), r1=174(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 174
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
