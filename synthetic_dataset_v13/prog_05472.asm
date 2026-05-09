; DESCRIPTION: Composite: Sets a single red pixel at (103, 68) then Places a blue circle of radius 40 at center (130, 46).
; PLAN: r0=103(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=46(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 68
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 130
LDI r6, 46
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
