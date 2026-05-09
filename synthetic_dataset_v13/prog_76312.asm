; DESCRIPTION: Places a green circle of radius 56 at center (82, 164).
; PLAN: r0=82(x), r1=164(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 164
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
