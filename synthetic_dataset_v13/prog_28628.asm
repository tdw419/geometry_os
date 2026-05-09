; DESCRIPTION: Places a black 10x58 rectangle at position (320, 121).
; PLAN: r0=320(x), r1=121(y), r2=10(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 121
LDI r2, 10
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
