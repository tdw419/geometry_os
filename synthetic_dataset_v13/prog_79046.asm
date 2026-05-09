; DESCRIPTION: Places a green 12x68 rectangle at position (167, 102).
; PLAN: r0=167(x), r1=102(y), r2=12(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 102
LDI r2, 12
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
