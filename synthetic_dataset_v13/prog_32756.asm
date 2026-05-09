; DESCRIPTION: Places a white 72x103 rectangle at position (262, 142).
; PLAN: r0=262(x), r1=142(y), r2=72(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 142
LDI r2, 72
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
