; DESCRIPTION: Places a green 104x43 rectangle at position (53, 152).
; PLAN: r0=53(x), r1=152(y), r2=104(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 152
LDI r2, 104
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
