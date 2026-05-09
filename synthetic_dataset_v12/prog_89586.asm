; DESCRIPTION: Composite: Places a magenta dot at position (48, 129) then Places a green circle of radius 47 at center (420, 84).
; PLAN: r0=48(x), r1=129(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=84(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 48
LDI r1, 129
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 84
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
