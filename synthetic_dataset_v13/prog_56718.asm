; DESCRIPTION: Places a green 56x39 rectangle at position (68, 18).
; PLAN: r0=68(x), r1=18(y), r2=56(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 18
LDI r2, 56
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
