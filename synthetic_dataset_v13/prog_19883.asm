; DESCRIPTION: Renders a cyan box of size 47x93 starting at (43, 121).
; PLAN: r0=43(x), r1=121(y), r2=47(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 121
LDI r2, 47
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
