; DESCRIPTION: Renders a cyan box of size 29x90 starting at (463, 45).
; PLAN: r0=463(x), r1=45(y), r2=29(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 45
LDI r2, 29
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
