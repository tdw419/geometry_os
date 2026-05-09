; DESCRIPTION: Places a magenta 30x64 rectangle at position (213, 113).
; PLAN: r0=213(x), r1=113(y), r2=30(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 113
LDI r2, 30
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
