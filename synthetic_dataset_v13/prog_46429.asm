; DESCRIPTION: Composite: Renders a white box of size 63x63 starting at (80, 63) then Sets a single white pixel at (436, 34).
; PLAN: r0=80(x), r1=63(y), r2=63(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=34(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 63
LDI r2, 63
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 34
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
