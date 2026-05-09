; DESCRIPTION: Places a black 16x50 rectangle at position (255, 43).
; PLAN: r0=255(x), r1=43(y), r2=16(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 43
LDI r2, 16
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
