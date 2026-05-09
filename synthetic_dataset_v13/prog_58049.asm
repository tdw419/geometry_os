; DESCRIPTION: Places a cyan 75x70 rectangle at position (352, 24).
; PLAN: r0=352(x), r1=24(y), r2=75(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 24
LDI r2, 75
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
