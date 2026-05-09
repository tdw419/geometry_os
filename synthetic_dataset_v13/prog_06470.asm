; DESCRIPTION: Places a purple circle of radius 22 at center (479, 82).
; PLAN: r0=479(x), r1=82(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 82
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
