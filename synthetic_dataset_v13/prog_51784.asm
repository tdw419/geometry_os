; DESCRIPTION: Places a magenta 113x15 rectangle at position (141, 235).
; PLAN: r0=141(x), r1=235(y), r2=113(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 235
LDI r2, 113
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
