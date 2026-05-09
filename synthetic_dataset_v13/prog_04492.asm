; DESCRIPTION: Places a green 62x47 rectangle at position (144, 141).
; PLAN: r0=144(x), r1=141(y), r2=62(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 141
LDI r2, 62
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
