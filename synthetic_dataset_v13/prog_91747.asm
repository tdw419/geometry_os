; DESCRIPTION: Renders a white box of size 103x113 starting at (31, 112).
; PLAN: r0=31(x), r1=112(y), r2=103(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 112
LDI r2, 103
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
