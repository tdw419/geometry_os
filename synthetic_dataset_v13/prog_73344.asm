; DESCRIPTION: Places a cyan 75x115 rectangle at position (161, 1).
; PLAN: r0=161(x), r1=1(y), r2=75(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 1
LDI r2, 75
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
