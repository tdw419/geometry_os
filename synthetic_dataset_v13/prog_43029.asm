; DESCRIPTION: Renders a magenta box of size 68x83 starting at (213, 68).
; PLAN: r0=213(x), r1=68(y), r2=68(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 68
LDI r2, 68
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
