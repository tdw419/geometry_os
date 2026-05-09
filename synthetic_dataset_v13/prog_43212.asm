; DESCRIPTION: Composite: Places a black dot at position (197, 99) then Places a orange circle of radius 55 at center (59, 84).
; PLAN: r0=197(x), r1=99(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=84(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 197
LDI r1, 99
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 59
LDI r6, 84
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
