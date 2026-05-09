; DESCRIPTION: Composite: Draws a blue circle centered at (280, 166) with radius 51 then Renders a red box of size 79x84 starting at (177, 25).
; PLAN: r0=280(x), r1=166(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=25(y), r7=79(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 166
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 25
LDI r7, 79
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
