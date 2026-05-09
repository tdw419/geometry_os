; DESCRIPTION: Composite: Draws a red circle centered at (394, 143) with radius 54 then Sets a single green pixel at (442, 228).
; PLAN: r0=394(x), r1=143(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x), r6=228(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 143
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 228
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
