; DESCRIPTION: Composite: Places a orange 117x113 rectangle at position (379, 29) then Places a yellow dot at position (33, 89).
; PLAN: r0=379(x), r1=29(y), r2=117(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x), r6=89(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 29
LDI r2, 117
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 89
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
