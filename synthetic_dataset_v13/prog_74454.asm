; DESCRIPTION: Places a cyan 57x36 rectangle at position (244, 65).
; PLAN: r0=244(x), r1=65(y), r2=57(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 65
LDI r2, 57
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
