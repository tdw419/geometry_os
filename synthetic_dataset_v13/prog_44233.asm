; DESCRIPTION: Places a red 87x17 rectangle at position (10, 165).
; PLAN: r0=10(x), r1=165(y), r2=87(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 165
LDI r2, 87
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
