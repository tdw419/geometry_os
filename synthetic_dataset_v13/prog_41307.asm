; DESCRIPTION: Renders a green box of size 101x14 starting at (410, 102).
; PLAN: r0=410(x), r1=102(y), r2=101(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 102
LDI r2, 101
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
