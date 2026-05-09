; DESCRIPTION: Composite: Places a blue dot at position (309, 157) then Renders a green box of size 77x98 starting at (244, 47) then Renders a magenta disk with center (199, 114) and radius 47.
; PLAN: r0=309(x), r1=157(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=47(y), r7=77(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x), r11=114(y), r12=47(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 157
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 47
LDI r7, 77
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 114
LDI r12, 47
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
