; DESCRIPTION: Composite: Renders a orange box of size 43x114 starting at (43, 125) then Places a blue dot at position (363, 133).
; PLAN: r0=43(x), r1=125(y), r2=43(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=133(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 125
LDI r2, 43
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 133
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
