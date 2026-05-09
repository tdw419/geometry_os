; DESCRIPTION: Places a orange 49x72 rectangle at position (262, 171).
; PLAN: r0=262(x), r1=171(y), r2=49(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 171
LDI r2, 49
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
