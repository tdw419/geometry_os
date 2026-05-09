; DESCRIPTION: Places a white 103x116 rectangle at position (403, 114).
; PLAN: r0=403(x), r1=114(y), r2=103(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 114
LDI r2, 103
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
