; DESCRIPTION: Renders a cyan box of size 115x107 starting at (56, 136).
; PLAN: r0=56(x), r1=136(y), r2=115(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 136
LDI r2, 115
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
