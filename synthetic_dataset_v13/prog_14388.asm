; DESCRIPTION: Places a green 14x69 rectangle at position (165, 124).
; PLAN: r0=165(x), r1=124(y), r2=14(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 124
LDI r2, 14
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
