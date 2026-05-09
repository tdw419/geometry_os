; DESCRIPTION: Renders a green box of size 47x52 starting at (187, 68).
; PLAN: r0=187(x), r1=68(y), r2=47(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 68
LDI r2, 47
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
