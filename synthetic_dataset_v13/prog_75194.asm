; DESCRIPTION: Places a red 58x66 rectangle at position (192, 44).
; PLAN: r0=192(x), r1=44(y), r2=58(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 44
LDI r2, 58
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
