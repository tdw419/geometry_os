; DESCRIPTION: Renders a green box of size 90x22 starting at (323, 42).
; PLAN: r0=323(x), r1=42(y), r2=90(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 42
LDI r2, 90
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
