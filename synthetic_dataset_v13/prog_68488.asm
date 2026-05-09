; DESCRIPTION: Places a yellow circle of radius 11 at center (479, 149).
; PLAN: r0=479(x), r1=149(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 149
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
