; DESCRIPTION: Places a black 56x55 rectangle at position (3, 167).
; PLAN: r0=3(x), r1=167(y), r2=56(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 167
LDI r2, 56
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
