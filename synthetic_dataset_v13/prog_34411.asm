; DESCRIPTION: Renders a cyan box of size 115x29 starting at (287, 127).
; PLAN: r0=287(x), r1=127(y), r2=115(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 127
LDI r2, 115
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
