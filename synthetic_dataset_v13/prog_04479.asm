; DESCRIPTION: Places a white 82x108 rectangle at position (389, 55).
; PLAN: r0=389(x), r1=55(y), r2=82(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 55
LDI r2, 82
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
