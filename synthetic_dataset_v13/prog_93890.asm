; DESCRIPTION: Composite: Places a green 63x111 rectangle at position (106, 26) then Creates a white circular shape at (223, 161) with radius 54.
; PLAN: r0=106(x), r1=26(y), r2=63(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=161(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 106
LDI r1, 26
LDI r2, 63
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 161
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
