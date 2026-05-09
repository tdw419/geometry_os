; DESCRIPTION: Renders a cyan box of size 118x70 starting at (137, 58).
; PLAN: r0=137(x), r1=58(y), r2=118(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 58
LDI r2, 118
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
