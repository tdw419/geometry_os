; DESCRIPTION: Renders a green box of size 106x37 starting at (294, 29).
; PLAN: r0=294(x), r1=29(y), r2=106(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 29
LDI r2, 106
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
