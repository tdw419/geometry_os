; DESCRIPTION: Composite: Places a purple dot at position (324, 207) then Places a cyan 77x34 rectangle at position (88, 40).
; PLAN: r0=324(x), r1=207(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=40(y), r7=77(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 207
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 40
LDI r7, 77
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
