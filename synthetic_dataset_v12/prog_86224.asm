; DESCRIPTION: Composite: Places a white circle of radius 48 at center (151, 141) then Places a cyan dot at position (487, 42).
; PLAN: r0=151(x), r1=141(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x), r6=42(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 141
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 42
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
