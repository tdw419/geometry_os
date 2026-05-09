; DESCRIPTION: Renders a cyan box of size 101x36 starting at (175, 112).
; PLAN: r0=175(x), r1=112(y), r2=101(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 112
LDI r2, 101
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
