; DESCRIPTION: Composite: Draws a red rectangle at (260, 138) with width 88 and height 46 then Sets a single white pixel at (120, 95).
; PLAN: r0=260(x), r1=138(y), r2=88(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=95(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 138
LDI r2, 88
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 95
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
