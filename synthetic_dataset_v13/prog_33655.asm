; DESCRIPTION: Renders a magenta box of size 82x82 starting at (235, 166).
; PLAN: r0=235(x), r1=166(y), r2=82(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 166
LDI r2, 82
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
