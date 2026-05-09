; DESCRIPTION: Renders a magenta box of size 67x107 starting at (445, 49).
; PLAN: r0=445(x), r1=49(y), r2=67(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 49
LDI r2, 67
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
