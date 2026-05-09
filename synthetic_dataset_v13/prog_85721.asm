; DESCRIPTION: Composite: Places a magenta dot at position (299, 64) then Renders a cyan disk with center (367, 129) and radius 71.
; PLAN: r0=299(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=129(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 64
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 129
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
