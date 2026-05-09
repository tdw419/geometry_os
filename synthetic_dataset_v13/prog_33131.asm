; DESCRIPTION: Renders a magenta box of size 39x74 starting at (441, 14).
; PLAN: r0=441(x), r1=14(y), r2=39(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 14
LDI r2, 39
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
