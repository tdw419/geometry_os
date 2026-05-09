; DESCRIPTION: Places a cyan 70x83 rectangle at position (352, 66).
; PLAN: r0=352(x), r1=66(y), r2=70(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 66
LDI r2, 70
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
