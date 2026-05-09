; DESCRIPTION: Renders a magenta box of size 108x47 starting at (244, 67).
; PLAN: r0=244(x), r1=67(y), r2=108(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 67
LDI r2, 108
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
