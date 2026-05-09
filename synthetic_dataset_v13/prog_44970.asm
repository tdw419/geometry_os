; DESCRIPTION: Composite: Places a green dot at position (372, 192) then Renders a orange disk with center (410, 142) and radius 68.
; PLAN: r0=372(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=142(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 410
LDI r6, 142
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
