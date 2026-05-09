; DESCRIPTION: Composite: Renders a cyan disk with center (375, 82) and radius 73 then Draws a magenta rectangle at (404, 18) with width 87 and height 112.
; PLAN: r0=375(x), r1=82(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=18(y), r7=87(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 82
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 18
LDI r7, 87
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
