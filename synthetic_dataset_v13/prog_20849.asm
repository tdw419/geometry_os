; DESCRIPTION: Renders a magenta box of size 28x12 starting at (66, 186).
; PLAN: r0=66(x), r1=186(y), r2=28(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 186
LDI r2, 28
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
