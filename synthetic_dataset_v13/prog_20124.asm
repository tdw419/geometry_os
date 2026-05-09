; DESCRIPTION: Renders a magenta box of size 66x73 starting at (386, 18).
; PLAN: r0=386(x), r1=18(y), r2=66(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 18
LDI r2, 66
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
