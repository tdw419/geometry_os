; DESCRIPTION: Places a cyan 107x70 rectangle at position (20, 94).
; PLAN: r0=20(x), r1=94(y), r2=107(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 94
LDI r2, 107
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
