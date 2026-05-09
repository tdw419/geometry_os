; DESCRIPTION: Renders a cyan box of size 32x118 starting at (368, 122).
; PLAN: r0=368(x), r1=122(y), r2=32(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 122
LDI r2, 32
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
