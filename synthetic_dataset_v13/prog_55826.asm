; DESCRIPTION: Renders a cyan box of size 47x78 starting at (55, 106).
; PLAN: r0=55(x), r1=106(y), r2=47(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 106
LDI r2, 47
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
