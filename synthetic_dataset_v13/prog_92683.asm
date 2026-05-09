; DESCRIPTION: Places a green 23x39 rectangle at position (413, 65).
; PLAN: r0=413(x), r1=65(y), r2=23(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 65
LDI r2, 23
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
