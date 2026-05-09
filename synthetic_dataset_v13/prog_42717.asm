; DESCRIPTION: Composite: Draws a green rectangle at (403, 143) with width 96 and height 63 then Places a magenta circle of radius 40 at center (75, 214).
; PLAN: r0=403(x), r1=143(y), r2=96(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=214(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 143
LDI r2, 96
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 214
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
