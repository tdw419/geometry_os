; DESCRIPTION: Renders a magenta box of size 101x60 starting at (370, 178).
; PLAN: r0=370(x), r1=178(y), r2=101(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 178
LDI r2, 101
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
