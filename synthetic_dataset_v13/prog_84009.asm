; DESCRIPTION: Places a green 34x27 rectangle at position (338, 62).
; PLAN: r0=338(x), r1=62(y), r2=34(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 62
LDI r2, 34
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
