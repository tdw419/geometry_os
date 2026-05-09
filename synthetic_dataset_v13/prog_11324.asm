; DESCRIPTION: Renders a cyan box of size 86x98 starting at (147, 115).
; PLAN: r0=147(x), r1=115(y), r2=86(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 115
LDI r2, 86
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
