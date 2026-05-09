; DESCRIPTION: Composite: Draws a yellow rectangle at (342, 33) with width 80 and height 96 then Places a magenta dot at position (188, 219).
; PLAN: r0=342(x), r1=33(y), r2=80(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x), r6=219(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 342
LDI r1, 33
LDI r2, 80
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 219
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
