; DESCRIPTION: Composite: Places a white 57x66 rectangle at position (223, 113) then Sets a single black pixel at (507, 7).
; PLAN: r0=223(x), r1=113(y), r2=57(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x), r6=7(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 113
LDI r2, 57
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 7
LDI r7, 0x000000
PSET r5, r6, r7
HALT
