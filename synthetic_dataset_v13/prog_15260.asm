; DESCRIPTION: Places a magenta 60x99 rectangle at position (111, 113).
; PLAN: r0=111(x), r1=113(y), r2=60(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 113
LDI r2, 60
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
