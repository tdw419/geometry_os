; DESCRIPTION: Places a cyan 50x38 rectangle at position (359, 156).
; PLAN: r0=359(x), r1=156(y), r2=50(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 156
LDI r2, 50
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
