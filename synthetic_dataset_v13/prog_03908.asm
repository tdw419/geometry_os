; DESCRIPTION: Places a green 78x38 rectangle at position (294, 99).
; PLAN: r0=294(x), r1=99(y), r2=78(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 99
LDI r2, 78
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
