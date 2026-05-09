; DESCRIPTION: Places a magenta 113x25 rectangle at position (375, 95).
; PLAN: r0=375(x), r1=95(y), r2=113(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 95
LDI r2, 113
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
