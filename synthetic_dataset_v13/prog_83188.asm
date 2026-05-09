; DESCRIPTION: Composite: Renders a orange box of size 85x96 starting at (258, 110) then Places a orange dot at position (504, 130).
; PLAN: r0=258(x), r1=110(y), r2=85(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=130(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 110
LDI r2, 85
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 130
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
