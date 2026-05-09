; DESCRIPTION: Places a green 109x22 rectangle at position (331, 167).
; PLAN: r0=331(x), r1=167(y), r2=109(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 167
LDI r2, 109
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
