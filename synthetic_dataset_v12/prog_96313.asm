; DESCRIPTION: Renders a cyan box of size 118x32 starting at (101, 100).
; PLAN: r0=101(x), r1=100(y), r2=118(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 100
LDI r2, 118
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
