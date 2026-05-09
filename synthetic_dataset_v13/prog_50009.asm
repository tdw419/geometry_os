; DESCRIPTION: Composite: Places a white dot at position (482, 159) then Creates a magenta circular shape at (70, 206) with radius 50.
; PLAN: r0=482(x), r1=159(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=206(y), r7=50(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 482
LDI r1, 159
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 70
LDI r6, 206
LDI r7, 50
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
