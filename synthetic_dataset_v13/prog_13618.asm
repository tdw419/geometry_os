; DESCRIPTION: Places a orange 82x29 rectangle at position (258, 143).
; PLAN: r0=258(x), r1=143(y), r2=82(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 143
LDI r2, 82
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
