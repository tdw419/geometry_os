; DESCRIPTION: Places a blue 12x50 rectangle at position (410, 151).
; PLAN: r0=410(x), r1=151(y), r2=12(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 151
LDI r2, 12
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
