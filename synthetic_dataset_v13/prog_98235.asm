; DESCRIPTION: Places a red 31x113 rectangle at position (10, 15).
; PLAN: r0=10(x), r1=15(y), r2=31(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 15
LDI r2, 31
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
