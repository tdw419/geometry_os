; DESCRIPTION: Places a white 104x71 rectangle at position (262, 103).
; PLAN: r0=262(x), r1=103(y), r2=104(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 103
LDI r2, 104
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
