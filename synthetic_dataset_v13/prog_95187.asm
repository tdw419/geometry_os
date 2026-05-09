; DESCRIPTION: Places a black 79x35 rectangle at position (320, 43).
; PLAN: r0=320(x), r1=43(y), r2=79(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 43
LDI r2, 79
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
