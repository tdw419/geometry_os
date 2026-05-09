; DESCRIPTION: Places a green 34x113 rectangle at position (86, 98).
; PLAN: r0=86(x), r1=98(y), r2=34(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 98
LDI r2, 34
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
