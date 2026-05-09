; DESCRIPTION: Composite: Draws a yellow rectangle at (33, 194) with width 113 and height 54 then Sets a single white pixel at (5, 173).
; PLAN: r0=33(x), r1=194(y), r2=113(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x), r6=173(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 194
LDI r2, 113
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 173
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
