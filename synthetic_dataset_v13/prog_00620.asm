; DESCRIPTION: Places a white 82x82 rectangle at position (161, 36).
; PLAN: r0=161(x), r1=36(y), r2=82(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 36
LDI r2, 82
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
