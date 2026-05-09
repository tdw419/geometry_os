; DESCRIPTION: Places a cyan 95x70 rectangle at position (268, 161).
; PLAN: r0=268(x), r1=161(y), r2=95(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 161
LDI r2, 95
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
