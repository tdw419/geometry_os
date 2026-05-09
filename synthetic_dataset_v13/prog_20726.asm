; DESCRIPTION: Composite: Places a magenta dot at position (62, 138) then Renders a cyan disk with center (305, 179) and radius 74.
; PLAN: r0=62(x), r1=138(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=179(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 62
LDI r1, 138
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 179
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
