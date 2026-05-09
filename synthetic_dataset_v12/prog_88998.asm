; DESCRIPTION: Composite: Renders a orange box of size 29x83 starting at (428, 87) then Places a orange dot at position (355, 175).
; PLAN: r0=428(x), r1=87(y), r2=29(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=175(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 428
LDI r1, 87
LDI r2, 29
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 175
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
