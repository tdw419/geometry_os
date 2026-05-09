; DESCRIPTION: Places a magenta 78x25 rectangle at position (384, 171).
; PLAN: r0=384(x), r1=171(y), r2=78(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 171
LDI r2, 78
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
