; DESCRIPTION: Renders a cyan box of size 28x101 starting at (321, 148).
; PLAN: r0=321(x), r1=148(y), r2=28(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 148
LDI r2, 28
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
