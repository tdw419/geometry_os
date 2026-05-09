; DESCRIPTION: Places a orange 55x43 rectangle at position (323, 196).
; PLAN: r0=323(x), r1=196(y), r2=55(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 196
LDI r2, 55
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
