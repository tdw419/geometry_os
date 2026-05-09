; DESCRIPTION: Places a red 23x54 rectangle at position (261, 21).
; PLAN: r0=261(x), r1=21(y), r2=23(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 21
LDI r2, 23
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
