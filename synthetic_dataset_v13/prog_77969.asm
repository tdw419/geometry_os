; DESCRIPTION: Composite: Places a cyan dot at position (359, 231) then Renders a cyan disk with center (154, 199) and radius 57.
; PLAN: r0=359(x), r1=231(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=199(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 231
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 199
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
