; DESCRIPTION: Places a magenta 39x16 rectangle at position (119, 171).
; PLAN: r0=119(x), r1=171(y), r2=39(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 171
LDI r2, 39
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
