; DESCRIPTION: Renders a cyan box of size 52x96 starting at (26, 46).
; PLAN: r0=26(x), r1=46(y), r2=52(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 46
LDI r2, 52
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
