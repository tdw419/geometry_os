; DESCRIPTION: Places a green 114x62 rectangle at position (356, 91).
; PLAN: r0=356(x), r1=91(y), r2=114(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 91
LDI r2, 114
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
