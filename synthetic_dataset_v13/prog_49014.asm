; DESCRIPTION: Places a orange 83x22 rectangle at position (29, 166).
; PLAN: r0=29(x), r1=166(y), r2=83(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 166
LDI r2, 83
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
