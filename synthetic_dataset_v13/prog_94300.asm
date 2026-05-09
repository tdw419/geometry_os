; DESCRIPTION: Renders a cyan box of size 29x65 starting at (170, 115).
; PLAN: r0=170(x), r1=115(y), r2=29(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 115
LDI r2, 29
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
