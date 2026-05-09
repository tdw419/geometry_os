; DESCRIPTION: Places a yellow circle of radius 23 at center (479, 174).
; PLAN: r0=479(x), r1=174(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 174
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
