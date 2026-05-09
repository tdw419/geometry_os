; DESCRIPTION: Places a black 80x98 rectangle at position (262, 56).
; PLAN: r0=262(x), r1=56(y), r2=80(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 56
LDI r2, 80
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
