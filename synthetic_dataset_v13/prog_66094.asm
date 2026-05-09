; DESCRIPTION: Renders a cyan box of size 95x37 starting at (99, 3).
; PLAN: r0=99(x), r1=3(y), r2=95(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 3
LDI r2, 95
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
