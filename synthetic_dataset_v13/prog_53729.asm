; DESCRIPTION: Places a white 69x47 rectangle at position (346, 155).
; PLAN: r0=346(x), r1=155(y), r2=69(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 155
LDI r2, 69
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
