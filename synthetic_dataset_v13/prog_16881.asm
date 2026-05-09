; DESCRIPTION: Renders a black box of size 47x13 starting at (370, 68).
; PLAN: r0=370(x), r1=68(y), r2=47(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 68
LDI r2, 47
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
