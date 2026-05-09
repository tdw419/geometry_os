; DESCRIPTION: Places a red 100x87 rectangle at position (262, 129).
; PLAN: r0=262(x), r1=129(y), r2=100(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 129
LDI r2, 100
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
