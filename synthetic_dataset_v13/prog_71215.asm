; DESCRIPTION: Composite: Places a blue dot at position (437, 6) then Renders a blue box of size 47x107 starting at (19, 18).
; PLAN: r0=437(x), r1=6(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=18(y), r7=47(width), r8=107(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 6
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 18
LDI r7, 47
LDI r8, 107
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
