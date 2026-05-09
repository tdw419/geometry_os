; DESCRIPTION: Places a yellow 83x35 rectangle at position (234, 126).
; PLAN: r0=234(x), r1=126(y), r2=83(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 126
LDI r2, 83
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
