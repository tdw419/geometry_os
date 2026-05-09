; DESCRIPTION: Renders a magenta box of size 73x107 starting at (344, 43).
; PLAN: r0=344(x), r1=43(y), r2=73(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 43
LDI r2, 73
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
