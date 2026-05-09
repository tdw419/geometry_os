; DESCRIPTION: Places a red 17x72 rectangle at position (238, 106).
; PLAN: r0=238(x), r1=106(y), r2=17(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 106
LDI r2, 17
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
