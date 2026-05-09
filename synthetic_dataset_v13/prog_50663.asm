; DESCRIPTION: Places a white 108x23 rectangle at position (213, 173).
; PLAN: r0=213(x), r1=173(y), r2=108(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 173
LDI r2, 108
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
