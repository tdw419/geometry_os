; DESCRIPTION: Places a cyan 108x17 rectangle at position (7, 2).
; PLAN: r0=7(x), r1=2(y), r2=108(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 2
LDI r2, 108
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
