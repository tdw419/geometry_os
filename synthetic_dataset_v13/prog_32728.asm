; DESCRIPTION: Places a magenta 26x97 rectangle at position (374, 134).
; PLAN: r0=374(x), r1=134(y), r2=26(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 134
LDI r2, 26
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
