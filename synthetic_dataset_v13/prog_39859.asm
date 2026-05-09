; DESCRIPTION: Composite: Creates a blue circular shape at (281, 100) with radius 68 then Places a green dot at position (303, 254).
; PLAN: r0=281(x), r1=100(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x), r6=254(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 100
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 254
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
