; DESCRIPTION: Composite: Places a magenta 99x20 rectangle at position (177, 199) then Renders a white disk with center (107, 145) and radius 79.
; PLAN: r0=177(x), r1=199(y), r2=99(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=145(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 177
LDI r1, 199
LDI r2, 99
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 145
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
