; DESCRIPTION: Places a green 103x69 rectangle at position (156, 108).
; PLAN: r0=156(x), r1=108(y), r2=103(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 108
LDI r2, 103
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
