; DESCRIPTION: Renders a cyan box of size 15x96 starting at (78, 132).
; PLAN: r0=78(x), r1=132(y), r2=15(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 132
LDI r2, 15
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
