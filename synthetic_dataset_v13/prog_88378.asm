; DESCRIPTION: Composite: Draws a yellow rectangle at (123, 82) with width 41 and height 43 then Sets a single white pixel at (113, 210).
; PLAN: r0=123(x), r1=82(y), r2=41(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=210(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 82
LDI r2, 41
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 210
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
