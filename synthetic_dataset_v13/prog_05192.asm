; DESCRIPTION: Composite: Places a magenta dot at position (87, 173) then Places a green circle of radius 39 at center (110, 125).
; PLAN: r0=87(x), r1=173(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=125(y), r7=39(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 173
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 125
LDI r7, 39
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
