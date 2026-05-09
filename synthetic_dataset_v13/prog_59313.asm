; DESCRIPTION: Places a green 13x69 rectangle at position (242, 53).
; PLAN: r0=242(x), r1=53(y), r2=13(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 53
LDI r2, 13
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
