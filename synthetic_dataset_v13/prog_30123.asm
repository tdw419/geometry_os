; DESCRIPTION: Composite: Renders a black disk with center (222, 61) and radius 26 then Places a cyan dot at position (485, 113).
; PLAN: r0=222(x), r1=61(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x), r6=113(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 61
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 113
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
