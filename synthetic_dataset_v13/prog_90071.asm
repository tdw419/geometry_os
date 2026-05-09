; DESCRIPTION: Renders a cyan box of size 23x57 starting at (457, 1).
; PLAN: r0=457(x), r1=1(y), r2=23(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 1
LDI r2, 23
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
