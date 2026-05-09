; DESCRIPTION: Renders a cyan box of size 20x99 starting at (254, 90).
; PLAN: r0=254(x), r1=90(y), r2=20(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 90
LDI r2, 20
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
