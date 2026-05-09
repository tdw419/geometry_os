; DESCRIPTION: Places a magenta 97x93 rectangle at position (263, 46).
; PLAN: r0=263(x), r1=46(y), r2=97(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 46
LDI r2, 97
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
