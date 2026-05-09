; DESCRIPTION: Places a cyan 38x26 rectangle at position (138, 72).
; PLAN: r0=138(x), r1=72(y), r2=38(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 72
LDI r2, 38
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
