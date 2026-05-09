; DESCRIPTION: Places a orange 68x102 rectangle at position (209, 16).
; PLAN: r0=209(x), r1=16(y), r2=68(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 16
LDI r2, 68
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
