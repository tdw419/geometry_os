; DESCRIPTION: Renders a white box of size 113x105 starting at (39, 109).
; PLAN: r0=39(x), r1=109(y), r2=113(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 109
LDI r2, 113
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
