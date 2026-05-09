; DESCRIPTION: Places a red 28x76 rectangle at position (3, 105).
; PLAN: r0=3(x), r1=105(y), r2=28(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 105
LDI r2, 28
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
