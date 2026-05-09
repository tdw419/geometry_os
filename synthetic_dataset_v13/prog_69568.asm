; DESCRIPTION: Places a orange 82x16 rectangle at position (197, 123).
; PLAN: r0=197(x), r1=123(y), r2=82(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 123
LDI r2, 82
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
