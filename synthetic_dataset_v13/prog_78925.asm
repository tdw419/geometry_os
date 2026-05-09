; DESCRIPTION: Renders a cyan box of size 23x96 starting at (303, 25).
; PLAN: r0=303(x), r1=25(y), r2=23(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 25
LDI r2, 23
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
