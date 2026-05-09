; DESCRIPTION: Renders a blue box of size 82x33 starting at (268, 66).
; PLAN: r0=268(x), r1=66(y), r2=82(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 66
LDI r2, 82
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
