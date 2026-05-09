; DESCRIPTION: Composite: Draws a black rectangle at (73, 6) with width 30 and height 120 then Sets a single white pixel at (178, 220).
; PLAN: r0=73(x), r1=6(y), r2=30(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=220(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 6
LDI r2, 30
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 220
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
