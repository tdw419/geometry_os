; DESCRIPTION: Places a white 14x82 rectangle at position (383, 163).
; PLAN: r0=383(x), r1=163(y), r2=14(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 163
LDI r2, 14
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
