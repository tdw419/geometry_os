; DESCRIPTION: Renders a orange box of size 24x118 starting at (274, 107).
; PLAN: r0=274(x), r1=107(y), r2=24(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 107
LDI r2, 24
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
