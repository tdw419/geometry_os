; DESCRIPTION: Places a yellow 45x99 rectangle at position (234, 50).
; PLAN: r0=234(x), r1=50(y), r2=45(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 50
LDI r2, 45
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
