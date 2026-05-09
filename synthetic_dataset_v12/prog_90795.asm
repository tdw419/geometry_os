; DESCRIPTION: Composite: Renders a orange box of size 100x84 starting at (105, 1) then Sets a single cyan pixel at (213, 43).
; PLAN: r0=105(x), r1=1(y), r2=100(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=43(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 1
LDI r2, 100
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 43
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
