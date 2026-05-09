; DESCRIPTION: Places a black 58x13 rectangle at position (175, 214).
; PLAN: r0=175(x), r1=214(y), r2=58(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 214
LDI r2, 58
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
