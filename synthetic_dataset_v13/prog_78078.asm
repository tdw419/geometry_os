; DESCRIPTION: Renders a white box of size 16x15 starting at (106, 161).
; PLAN: r0=106(x), r1=161(y), r2=16(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 161
LDI r2, 16
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
