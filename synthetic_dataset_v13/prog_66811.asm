; DESCRIPTION: Renders a magenta box of size 104x43 starting at (143, 206).
; PLAN: r0=143(x), r1=206(y), r2=104(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 206
LDI r2, 104
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
