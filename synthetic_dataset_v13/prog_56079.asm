; DESCRIPTION: Composite: Renders a orange box of size 107x55 starting at (355, 35) then Places a blue dot at position (305, 189).
; PLAN: r0=355(x), r1=35(y), r2=107(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=189(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 35
LDI r2, 107
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 189
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
