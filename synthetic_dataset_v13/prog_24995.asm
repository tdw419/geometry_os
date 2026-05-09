; DESCRIPTION: Renders a white box of size 30x11 starting at (401, 66).
; PLAN: r0=401(x), r1=66(y), r2=30(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 66
LDI r2, 30
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
