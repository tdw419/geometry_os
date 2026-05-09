; DESCRIPTION: Composite: Places a cyan 62x69 rectangle at position (26, 95) then Places a cyan dot at position (271, 18).
; PLAN: r0=26(x), r1=95(y), r2=62(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=18(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 26
LDI r1, 95
LDI r2, 62
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 18
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
