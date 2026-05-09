; DESCRIPTION: Places a cyan 62x23 rectangle at position (292, 184).
; PLAN: r0=292(x), r1=184(y), r2=62(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 184
LDI r2, 62
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
