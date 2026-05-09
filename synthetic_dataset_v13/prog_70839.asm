; DESCRIPTION: Places a cyan 46x39 rectangle at position (134, 137).
; PLAN: r0=134(x), r1=137(y), r2=46(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 137
LDI r2, 46
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
