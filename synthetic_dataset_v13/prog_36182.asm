; DESCRIPTION: Places a white 109x60 rectangle at position (322, 67).
; PLAN: r0=322(x), r1=67(y), r2=109(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 67
LDI r2, 109
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
