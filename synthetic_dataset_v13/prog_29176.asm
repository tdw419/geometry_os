; DESCRIPTION: Renders a cyan box of size 11x106 starting at (188, 33).
; PLAN: r0=188(x), r1=33(y), r2=11(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 33
LDI r2, 11
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
