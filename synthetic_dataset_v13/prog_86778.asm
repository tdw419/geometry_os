; DESCRIPTION: Composite: Renders a orange box of size 21x89 starting at (270, 137) then Places a blue dot at position (20, 195).
; PLAN: r0=270(x), r1=137(y), r2=21(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x), r6=195(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 137
LDI r2, 21
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 195
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
