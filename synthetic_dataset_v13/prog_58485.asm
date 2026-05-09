; DESCRIPTION: Places a magenta 25x72 rectangle at position (206, 9).
; PLAN: r0=206(x), r1=9(y), r2=25(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 9
LDI r2, 25
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
