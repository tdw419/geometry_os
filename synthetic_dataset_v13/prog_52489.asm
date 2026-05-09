; DESCRIPTION: Renders a cyan box of size 45x23 starting at (421, 2).
; PLAN: r0=421(x), r1=2(y), r2=45(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 2
LDI r2, 45
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
