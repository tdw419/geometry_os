; DESCRIPTION: Renders a cyan box of size 23x31 starting at (23, 3).
; PLAN: r0=23(x), r1=3(y), r2=23(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 3
LDI r2, 23
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
