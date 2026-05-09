; DESCRIPTION: Renders a white box of size 76x105 starting at (7, 146).
; PLAN: r0=7(x), r1=146(y), r2=76(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 146
LDI r2, 76
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
