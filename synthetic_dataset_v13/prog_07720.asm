; DESCRIPTION: Composite: Renders a green box of size 26x61 starting at (363, 128) then Sets a single white pixel at (127, 109).
; PLAN: r0=363(x), r1=128(y), r2=26(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=109(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 363
LDI r1, 128
LDI r2, 26
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 109
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
