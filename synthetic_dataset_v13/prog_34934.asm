; DESCRIPTION: Composite: Creates a cyan circular shape at (154, 85) with radius 59 then Places a purple dot at position (360, 33).
; PLAN: r0=154(x), r1=85(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=33(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 154
LDI r1, 85
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 33
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
