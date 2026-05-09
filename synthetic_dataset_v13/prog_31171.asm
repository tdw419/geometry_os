; DESCRIPTION: Places a black circle of radius 35 at center (243, 215).
; PLAN: r0=243(x), r1=215(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 215
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
