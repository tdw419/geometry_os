; DESCRIPTION: Renders a cyan box of size 95x96 starting at (175, 121).
; PLAN: r0=175(x), r1=121(y), r2=95(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 121
LDI r2, 95
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
