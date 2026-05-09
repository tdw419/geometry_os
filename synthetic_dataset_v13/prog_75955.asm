; DESCRIPTION: Places a black 50x10 rectangle at position (166, 2).
; PLAN: r0=166(x), r1=2(y), r2=50(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 2
LDI r2, 50
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
