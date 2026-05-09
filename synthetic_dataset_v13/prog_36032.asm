; DESCRIPTION: Renders a magenta box of size 71x67 starting at (371, 7).
; PLAN: r0=371(x), r1=7(y), r2=71(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 7
LDI r2, 71
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
