; DESCRIPTION: Places a red 98x54 rectangle at position (136, 68).
; PLAN: r0=136(x), r1=68(y), r2=98(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 68
LDI r2, 98
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
