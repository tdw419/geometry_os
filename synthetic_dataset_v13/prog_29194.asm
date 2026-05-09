; DESCRIPTION: Composite: Places a orange dot at position (199, 129) then Renders a green disk with center (144, 56) and radius 50.
; PLAN: r0=199(x), r1=129(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=56(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 199
LDI r1, 129
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 144
LDI r6, 56
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
