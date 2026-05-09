; DESCRIPTION: Renders a magenta box of size 78x35 starting at (213, 125).
; PLAN: r0=213(x), r1=125(y), r2=78(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 125
LDI r2, 78
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
