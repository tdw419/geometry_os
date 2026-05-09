; DESCRIPTION: Renders a green box of size 47x21 starting at (25, 231).
; PLAN: r0=25(x), r1=231(y), r2=47(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 231
LDI r2, 47
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
