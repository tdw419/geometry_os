; DESCRIPTION: Renders a cyan box of size 118x57 starting at (250, 121).
; PLAN: r0=250(x), r1=121(y), r2=118(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 121
LDI r2, 118
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
