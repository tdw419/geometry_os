; DESCRIPTION: Composite: Places a magenta 75x109 rectangle at position (223, 9) then Sets a single white pixel at (285, 92).
; PLAN: r0=223(x), r1=9(y), r2=75(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x), r6=92(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 9
LDI r2, 75
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 92
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
