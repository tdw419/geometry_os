; DESCRIPTION: Places a cyan 47x98 rectangle at position (161, 135).
; PLAN: r0=161(x), r1=135(y), r2=47(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 135
LDI r2, 47
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
