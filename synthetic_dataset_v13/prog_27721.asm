; DESCRIPTION: Places a magenta 106x43 rectangle at position (164, 130).
; PLAN: r0=164(x), r1=130(y), r2=106(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 130
LDI r2, 106
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
