; DESCRIPTION: Composite: Places a purple dot at position (305, 188) then Renders a green disk with center (371, 146) and radius 57.
; PLAN: r0=305(x), r1=188(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=146(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 188
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 146
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
