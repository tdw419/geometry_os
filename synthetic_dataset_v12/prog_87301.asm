; DESCRIPTION: Composite: Places a red 22x70 rectangle at position (380, 47) then Places a black dot at position (102, 199).
; PLAN: r0=380(x), r1=47(y), r2=22(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=199(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 47
LDI r2, 22
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 199
LDI r7, 0x000000
PSET r5, r6, r7
HALT
