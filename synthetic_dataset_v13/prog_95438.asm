; DESCRIPTION: Places a yellow 84x35 rectangle at position (45, 14).
; PLAN: r0=45(x), r1=14(y), r2=84(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 14
LDI r2, 84
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
