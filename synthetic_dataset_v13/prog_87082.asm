; DESCRIPTION: Renders a cyan box of size 71x62 starting at (147, 81).
; PLAN: r0=147(x), r1=81(y), r2=71(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 81
LDI r2, 71
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
