; DESCRIPTION: Places a magenta 25x112 rectangle at position (246, 134).
; PLAN: r0=246(x), r1=134(y), r2=25(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 134
LDI r2, 25
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
