; DESCRIPTION: Places a cyan 69x93 rectangle at position (314, 113).
; PLAN: r0=314(x), r1=113(y), r2=69(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 113
LDI r2, 69
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
