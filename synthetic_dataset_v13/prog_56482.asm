; DESCRIPTION: Places a magenta 113x30 rectangle at position (197, 182).
; PLAN: r0=197(x), r1=182(y), r2=113(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 182
LDI r2, 113
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
