; DESCRIPTION: Composite: Renders a orange box of size 67x55 starting at (105, 178) then Places a orange dot at position (131, 119).
; PLAN: r0=105(x), r1=178(y), r2=67(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=119(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 178
LDI r2, 67
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 119
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
