; DESCRIPTION: Composite: Places a white 80x66 rectangle at position (259, 78) then Sets a single black pixel at (56, 191).
; PLAN: r0=259(x), r1=78(y), r2=80(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=191(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 78
LDI r2, 80
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 191
LDI r7, 0x000000
PSET r5, r6, r7
HALT
