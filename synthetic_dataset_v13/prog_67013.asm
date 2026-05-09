; DESCRIPTION: Places a cyan 65x60 rectangle at position (252, 161).
; PLAN: r0=252(x), r1=161(y), r2=65(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 161
LDI r2, 65
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
