; DESCRIPTION: Composite: Places a black dot at position (406, 187) then Places a blue circle of radius 47 at center (302, 166).
; PLAN: r0=406(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=166(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 187
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 302
LDI r6, 166
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
