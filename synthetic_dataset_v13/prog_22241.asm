; DESCRIPTION: Places a green circle of radius 21 at center (76, 146).
; PLAN: r0=76(x), r1=146(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 146
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
