; DESCRIPTION: Composite: Renders a red box of size 110x43 starting at (297, 5) then Sets a single white pixel at (504, 202).
; PLAN: r0=297(x), r1=5(y), r2=110(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=202(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 297
LDI r1, 5
LDI r2, 110
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 202
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
