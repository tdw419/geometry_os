; DESCRIPTION: Renders a cyan box of size 20x100 starting at (375, 140).
; PLAN: r0=375(x), r1=140(y), r2=20(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 140
LDI r2, 20
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
