; DESCRIPTION: Places a green 58x44 rectangle at position (167, 176).
; PLAN: r0=167(x), r1=176(y), r2=58(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 176
LDI r2, 58
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
