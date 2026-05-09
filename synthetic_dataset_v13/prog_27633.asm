; DESCRIPTION: Renders a cyan box of size 101x92 starting at (166, 145).
; PLAN: r0=166(x), r1=145(y), r2=101(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 145
LDI r2, 101
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
