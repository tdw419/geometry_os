; DESCRIPTION: Composite: Sets a single black pixel at (37, 122) then Places a green 56x25 rectangle at position (299, 55).
; PLAN: r0=37(x), r1=122(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=55(y), r7=56(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 122
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 299
LDI r6, 55
LDI r7, 56
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
