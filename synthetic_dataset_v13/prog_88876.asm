; DESCRIPTION: Places a green 66x19 rectangle at position (310, 165).
; PLAN: r0=310(x), r1=165(y), r2=66(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 165
LDI r2, 66
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
