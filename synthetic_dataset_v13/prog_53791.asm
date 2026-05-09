; DESCRIPTION: Places a cyan 70x14 rectangle at position (161, 79).
; PLAN: r0=161(x), r1=79(y), r2=70(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 79
LDI r2, 70
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
