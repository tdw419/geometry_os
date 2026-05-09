; DESCRIPTION: Places a black 84x50 rectangle at position (306, 128).
; PLAN: r0=306(x), r1=128(y), r2=84(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 128
LDI r2, 84
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
