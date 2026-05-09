; DESCRIPTION: Composite: Draws a yellow circle centered at (180, 79) with radius 25 then Renders a magenta box of size 73x81 starting at (421, 98).
; PLAN: r0=180(x), r1=79(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=98(y), r7=73(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 79
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 98
LDI r7, 73
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
