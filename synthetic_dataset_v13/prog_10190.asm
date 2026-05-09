; DESCRIPTION: Places a green 50x69 rectangle at position (74, 126).
; PLAN: r0=74(x), r1=126(y), r2=50(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 126
LDI r2, 50
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
