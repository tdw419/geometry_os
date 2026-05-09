; DESCRIPTION: Composite: Creates a green circular shape at (283, 133) with radius 80 then Places a cyan dot at position (367, 16).
; PLAN: r0=283(x), r1=133(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=16(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 133
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 16
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
