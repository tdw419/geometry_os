; DESCRIPTION: Places a white 69x106 rectangle at position (367, 133).
; PLAN: r0=367(x), r1=133(y), r2=69(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 133
LDI r2, 69
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
