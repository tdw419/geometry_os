; DESCRIPTION: Renders a white box of size 58x39 starting at (352, 194).
; PLAN: r0=352(x), r1=194(y), r2=58(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 194
LDI r2, 58
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
