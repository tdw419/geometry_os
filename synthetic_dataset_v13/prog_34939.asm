; DESCRIPTION: Renders a cyan box of size 89x105 starting at (129, 39).
; PLAN: r0=129(x), r1=39(y), r2=89(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 39
LDI r2, 89
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
