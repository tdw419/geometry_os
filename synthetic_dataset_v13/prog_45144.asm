; DESCRIPTION: Places a red 18x63 rectangle at position (353, 130).
; PLAN: r0=353(x), r1=130(y), r2=18(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 130
LDI r2, 18
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
