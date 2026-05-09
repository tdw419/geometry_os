; DESCRIPTION: Renders a white box of size 105x113 starting at (236, 68).
; PLAN: r0=236(x), r1=68(y), r2=105(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 68
LDI r2, 105
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
