; DESCRIPTION: Renders a green box of size 37x21 starting at (369, 12).
; PLAN: r0=369(x), r1=12(y), r2=37(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 12
LDI r2, 37
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
