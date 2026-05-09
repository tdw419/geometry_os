; DESCRIPTION: Places a magenta 66x46 rectangle at position (238, 113).
; PLAN: r0=238(x), r1=113(y), r2=66(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 113
LDI r2, 66
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
