; DESCRIPTION: Places a orange 76x115 rectangle at position (247, 113).
; PLAN: r0=247(x), r1=113(y), r2=76(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 113
LDI r2, 76
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
