; DESCRIPTION: Places a cyan 45x108 rectangle at position (212, 40).
; PLAN: r0=212(x), r1=40(y), r2=45(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 40
LDI r2, 45
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
