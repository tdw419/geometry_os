; DESCRIPTION: Renders a cyan box of size 104x24 starting at (93, 147).
; PLAN: r0=93(x), r1=147(y), r2=104(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 147
LDI r2, 104
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
