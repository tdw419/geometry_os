; DESCRIPTION: Renders a magenta box of size 66x30 starting at (198, 3).
; PLAN: r0=198(x), r1=3(y), r2=66(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 3
LDI r2, 66
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
