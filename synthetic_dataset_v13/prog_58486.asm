; DESCRIPTION: Places a black 118x72 rectangle at position (262, 146).
; PLAN: r0=262(x), r1=146(y), r2=118(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 146
LDI r2, 118
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
