; DESCRIPTION: Places a red 52x18 rectangle at position (18, 181).
; PLAN: r0=18(x), r1=181(y), r2=52(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 181
LDI r2, 52
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
