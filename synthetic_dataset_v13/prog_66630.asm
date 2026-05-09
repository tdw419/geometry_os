; DESCRIPTION: Renders a cyan box of size 101x63 starting at (20, 6).
; PLAN: r0=20(x), r1=6(y), r2=101(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 6
LDI r2, 101
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
