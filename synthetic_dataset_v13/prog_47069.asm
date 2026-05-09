; DESCRIPTION: Places a green circle of radius 14 at center (27, 236).
; PLAN: r0=27(x), r1=236(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 236
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
