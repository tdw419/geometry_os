; DESCRIPTION: Renders a cyan box of size 20x89 starting at (116, 121).
; PLAN: r0=116(x), r1=121(y), r2=20(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 121
LDI r2, 20
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
