; DESCRIPTION: Places a green 36x43 rectangle at position (175, 53).
; PLAN: r0=175(x), r1=53(y), r2=36(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 53
LDI r2, 36
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
