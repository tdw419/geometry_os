; DESCRIPTION: Places a white 43x72 rectangle at position (388, 153).
; PLAN: r0=388(x), r1=153(y), r2=43(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 153
LDI r2, 43
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
