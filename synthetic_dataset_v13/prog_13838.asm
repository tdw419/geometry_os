; DESCRIPTION: Places a white 29x35 rectangle at position (191, 198).
; PLAN: r0=191(x), r1=198(y), r2=29(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 198
LDI r2, 29
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
