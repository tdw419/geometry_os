; DESCRIPTION: Places a yellow circle of radius 68 at center (415, 108).
; PLAN: r0=415(x), r1=108(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 108
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
