; DESCRIPTION: Composite: Renders a yellow disk with center (254, 180) and radius 35 then Places a orange dot at position (444, 242).
; PLAN: r0=254(x), r1=180(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 180
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
