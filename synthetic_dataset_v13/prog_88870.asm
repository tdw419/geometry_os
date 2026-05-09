; DESCRIPTION: Composite: Renders a yellow box of size 83x42 starting at (414, 168) then Sets a single white pixel at (183, 189).
; PLAN: r0=414(x), r1=168(y), r2=83(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=189(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 168
LDI r2, 83
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 189
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
