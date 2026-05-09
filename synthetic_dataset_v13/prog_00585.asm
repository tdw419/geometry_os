; DESCRIPTION: Renders a green box of size 55x93 starting at (298, 101).
; PLAN: r0=298(x), r1=101(y), r2=55(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 101
LDI r2, 55
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
