; DESCRIPTION: Places a green 34x56 rectangle at position (396, 187).
; PLAN: r0=396(x), r1=187(y), r2=34(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 187
LDI r2, 34
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
