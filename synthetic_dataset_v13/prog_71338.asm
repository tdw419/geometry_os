; DESCRIPTION: Places a yellow 21x72 rectangle at position (255, 43).
; PLAN: r0=255(x), r1=43(y), r2=21(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 43
LDI r2, 21
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
