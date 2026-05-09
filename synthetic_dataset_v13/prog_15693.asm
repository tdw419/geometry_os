; DESCRIPTION: Places a cyan 108x58 rectangle at position (288, 87).
; PLAN: r0=288(x), r1=87(y), r2=108(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 87
LDI r2, 108
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
