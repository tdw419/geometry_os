; DESCRIPTION: Renders a green box of size 22x72 starting at (12, 142).
; PLAN: r0=12(x), r1=142(y), r2=22(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 142
LDI r2, 22
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
