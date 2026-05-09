; DESCRIPTION: Composite: Renders a magenta disk with center (256, 171) and radius 38 then Draws a yellow rectangle at (90, 177) with width 70 and height 25 then Places a green dot at position (471, 204).
; PLAN: r0=256(x), r1=171(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x), r6=177(y), r7=70(width), r8=25(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=471(x), r11=204(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 171
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 177
LDI r7, 70
LDI r8, 25
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 204
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
