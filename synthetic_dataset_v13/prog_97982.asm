; DESCRIPTION: Places a black 43x104 rectangle at position (150, 2).
; PLAN: r0=150(x), r1=2(y), r2=43(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 2
LDI r2, 43
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
