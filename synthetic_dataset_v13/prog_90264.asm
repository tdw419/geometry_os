; DESCRIPTION: Renders a magenta box of size 83x69 starting at (237, 67).
; PLAN: r0=237(x), r1=67(y), r2=83(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 67
LDI r2, 83
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
