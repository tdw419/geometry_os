; DESCRIPTION: Places a green 39x40 rectangle at position (91, 62).
; PLAN: r0=91(x), r1=62(y), r2=39(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 62
LDI r2, 39
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
