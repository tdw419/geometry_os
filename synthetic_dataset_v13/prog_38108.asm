; DESCRIPTION: Renders a magenta box of size 56x115 starting at (344, 5).
; PLAN: r0=344(x), r1=5(y), r2=56(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 5
LDI r2, 56
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
