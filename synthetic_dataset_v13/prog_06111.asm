; DESCRIPTION: Composite: Draws a green circle centered at (235, 82) with radius 38 then Places a blue 27x81 rectangle at position (414, 59).
; PLAN: r0=235(x), r1=82(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=59(y), r7=27(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 82
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 59
LDI r7, 27
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
