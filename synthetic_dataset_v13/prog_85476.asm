; DESCRIPTION: Places a red 61x28 rectangle at position (254, 28).
; PLAN: r0=254(x), r1=28(y), r2=61(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 28
LDI r2, 61
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
