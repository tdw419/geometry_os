; DESCRIPTION: Places a yellow circle of radius 15 at center (443, 231).
; PLAN: r0=443(x), r1=231(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 231
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
