; DESCRIPTION: Composite: Places a orange circle of radius 54 at center (359, 131) then Places a yellow dot at position (409, 46).
; PLAN: r0=359(x), r1=131(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=46(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 359
LDI r1, 131
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 46
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
