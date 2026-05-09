; DESCRIPTION: Renders a cyan box of size 80x87 starting at (430, 43).
; PLAN: r0=430(x), r1=43(y), r2=80(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 43
LDI r2, 80
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
