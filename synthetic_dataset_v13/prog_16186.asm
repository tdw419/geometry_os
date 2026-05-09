; DESCRIPTION: Places a cyan 78x95 rectangle at position (244, 144).
; PLAN: r0=244(x), r1=144(y), r2=78(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 144
LDI r2, 78
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
