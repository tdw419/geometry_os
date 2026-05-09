; DESCRIPTION: Places a blue 117x13 rectangle at position (262, 171).
; PLAN: r0=262(x), r1=171(y), r2=117(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 171
LDI r2, 117
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
