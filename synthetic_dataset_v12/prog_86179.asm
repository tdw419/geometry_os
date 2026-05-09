; DESCRIPTION: Places a white 55x108 rectangle at position (164, 43).
; PLAN: r0=164(x), r1=43(y), r2=55(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 43
LDI r2, 55
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
