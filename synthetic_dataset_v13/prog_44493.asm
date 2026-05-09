; DESCRIPTION: Renders a orange box of size 45x107 starting at (417, 109).
; PLAN: r0=417(x), r1=109(y), r2=45(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 109
LDI r2, 45
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
