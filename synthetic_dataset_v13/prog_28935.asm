; DESCRIPTION: Places a magenta 117x111 rectangle at position (358, 134).
; PLAN: r0=358(x), r1=134(y), r2=117(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 134
LDI r2, 117
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
