; DESCRIPTION: Places a red 83x84 rectangle at position (69, 166).
; PLAN: r0=69(x), r1=166(y), r2=83(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 166
LDI r2, 83
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
