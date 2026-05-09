; DESCRIPTION: Renders a orange box of size 75x45 starting at (321, 130).
; PLAN: r0=321(x), r1=130(y), r2=75(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 130
LDI r2, 75
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
