; DESCRIPTION: Renders a cyan box of size 11x34 starting at (117, 94).
; PLAN: r0=117(x), r1=94(y), r2=11(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 94
LDI r2, 11
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
