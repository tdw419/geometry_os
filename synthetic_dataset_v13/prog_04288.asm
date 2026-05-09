; DESCRIPTION: Places a red 119x28 rectangle at position (198, 181).
; PLAN: r0=198(x), r1=181(y), r2=119(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 181
LDI r2, 119
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
