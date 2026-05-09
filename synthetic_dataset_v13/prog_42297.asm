; DESCRIPTION: Places a orange 82x97 rectangle at position (327, 48).
; PLAN: r0=327(x), r1=48(y), r2=82(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 48
LDI r2, 82
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
