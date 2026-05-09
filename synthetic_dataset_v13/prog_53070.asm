; DESCRIPTION: Renders a cyan box of size 101x23 starting at (15, 219).
; PLAN: r0=15(x), r1=219(y), r2=101(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 219
LDI r2, 101
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
