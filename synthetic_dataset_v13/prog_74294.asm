; DESCRIPTION: Places a green circle of radius 47 at center (215, 193).
; PLAN: r0=215(x), r1=193(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 193
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
