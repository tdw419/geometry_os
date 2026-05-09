; DESCRIPTION: Renders a white box of size 113x14 starting at (342, 172).
; PLAN: r0=342(x), r1=172(y), r2=113(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 172
LDI r2, 113
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
