; DESCRIPTION: Places a black 48x62 rectangle at position (33, 160).
; PLAN: r0=33(x), r1=160(y), r2=48(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 160
LDI r2, 48
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
