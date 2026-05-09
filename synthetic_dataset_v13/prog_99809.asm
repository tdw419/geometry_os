; DESCRIPTION: Renders a purple box of size 78x67 starting at (239, 141).
; PLAN: r0=239(x), r1=141(y), r2=78(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 141
LDI r2, 78
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
