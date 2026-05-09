; DESCRIPTION: Renders a magenta box of size 66x19 starting at (164, 130).
; PLAN: r0=164(x), r1=130(y), r2=66(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 130
LDI r2, 66
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
