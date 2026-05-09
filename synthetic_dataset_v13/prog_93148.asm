; DESCRIPTION: Renders a magenta box of size 77x82 starting at (171, 4).
; PLAN: r0=171(x), r1=4(y), r2=77(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 4
LDI r2, 77
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
