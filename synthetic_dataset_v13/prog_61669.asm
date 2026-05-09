; DESCRIPTION: Renders a cyan box of size 102x11 starting at (159, 77).
; PLAN: r0=159(x), r1=77(y), r2=102(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 77
LDI r2, 102
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
