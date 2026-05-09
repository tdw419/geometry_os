; DESCRIPTION: Places a magenta 36x46 rectangle at position (326, 10).
; PLAN: r0=326(x), r1=10(y), r2=36(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 10
LDI r2, 36
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
