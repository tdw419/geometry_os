; DESCRIPTION: Renders a magenta box of size 39x38 starting at (304, 49).
; PLAN: r0=304(x), r1=49(y), r2=39(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 49
LDI r2, 39
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
