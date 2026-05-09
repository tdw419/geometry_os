; DESCRIPTION: Composite: Places a orange 45x44 rectangle at position (30, 59) then Places a black dot at position (208, 148).
; PLAN: r0=30(x), r1=59(y), r2=45(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=148(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 30
LDI r1, 59
LDI r2, 45
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 148
LDI r7, 0x000000
PSET r5, r6, r7
HALT
