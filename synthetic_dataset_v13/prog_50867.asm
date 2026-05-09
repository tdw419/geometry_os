; DESCRIPTION: Places a black 84x81 rectangle at position (386, 133).
; PLAN: r0=386(x), r1=133(y), r2=84(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 133
LDI r2, 84
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
