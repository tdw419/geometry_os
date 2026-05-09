; DESCRIPTION: Composite: Renders a white box of size 109x86 starting at (107, 11) then Sets a single white pixel at (79, 188).
; PLAN: r0=107(x), r1=11(y), r2=109(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=188(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 11
LDI r2, 109
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 188
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
