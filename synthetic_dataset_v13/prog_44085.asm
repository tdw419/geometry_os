; DESCRIPTION: Places a black 50x92 rectangle at position (175, 56).
; PLAN: r0=175(x), r1=56(y), r2=50(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 56
LDI r2, 50
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
