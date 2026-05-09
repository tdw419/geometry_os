; DESCRIPTION: Places a orange 113x115 rectangle at position (238, 30).
; PLAN: r0=238(x), r1=30(y), r2=113(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 30
LDI r2, 113
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
