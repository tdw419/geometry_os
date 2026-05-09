; DESCRIPTION: Places a cyan 107x54 rectangle at position (150, 184).
; PLAN: r0=150(x), r1=184(y), r2=107(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 184
LDI r2, 107
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
