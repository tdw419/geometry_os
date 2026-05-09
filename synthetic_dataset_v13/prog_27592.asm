; DESCRIPTION: Composite: Renders a white box of size 66x66 starting at (150, 115) then Sets a single black pixel at (198, 203).
; PLAN: r0=150(x), r1=115(y), r2=66(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=203(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 115
LDI r2, 66
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 203
LDI r7, 0x000000
PSET r5, r6, r7
HALT
