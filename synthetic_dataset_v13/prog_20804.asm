; DESCRIPTION: Composite: Places a green dot at position (103, 110) then Renders a magenta disk with center (112, 206) and radius 32.
; PLAN: r0=103(x), r1=110(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=206(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 110
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 112
LDI r6, 206
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
