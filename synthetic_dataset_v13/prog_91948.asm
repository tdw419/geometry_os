; DESCRIPTION: Composite: Sets a single red pixel at (256, 128) then Renders a orange disk with center (346, 82) and radius 57.
; PLAN: r0=256(x), r1=128(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=82(y), r7=57(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 256
LDI r1, 128
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 346
LDI r6, 82
LDI r7, 57
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
