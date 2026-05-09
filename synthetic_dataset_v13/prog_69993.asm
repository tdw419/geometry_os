; DESCRIPTION: Places a orange 101x69 rectangle at position (392, 4).
; PLAN: r0=392(x), r1=4(y), r2=101(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 4
LDI r2, 101
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
