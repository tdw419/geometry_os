; DESCRIPTION: Composite: Places a cyan dot at position (201, 39) then Places a white circle of radius 42 at center (176, 171).
; PLAN: r0=201(x), r1=39(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=171(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 39
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 171
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
