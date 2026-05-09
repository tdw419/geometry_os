; DESCRIPTION: Renders a white box of size 50x67 starting at (199, 136).
; PLAN: r0=199(x), r1=136(y), r2=50(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 136
LDI r2, 50
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
