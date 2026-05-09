; DESCRIPTION: Renders a green box of size 15x15 starting at (303, 170).
; PLAN: r0=303(x), r1=170(y), r2=15(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 170
LDI r2, 15
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
