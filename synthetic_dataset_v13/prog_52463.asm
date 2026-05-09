; DESCRIPTION: Places a cyan 38x73 rectangle at position (62, 166).
; PLAN: r0=62(x), r1=166(y), r2=38(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 166
LDI r2, 38
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
