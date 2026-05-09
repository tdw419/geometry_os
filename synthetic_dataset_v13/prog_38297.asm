; DESCRIPTION: Places a red 90x113 rectangle at position (231, 130).
; PLAN: r0=231(x), r1=130(y), r2=90(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 130
LDI r2, 90
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
