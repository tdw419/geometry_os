; DESCRIPTION: Places a white 48x76 rectangle at position (246, 67).
; PLAN: r0=246(x), r1=67(y), r2=48(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 67
LDI r2, 48
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
