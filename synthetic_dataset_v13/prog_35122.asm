; DESCRIPTION: Renders a cyan box of size 18x85 starting at (344, 77).
; PLAN: r0=344(x), r1=77(y), r2=18(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 77
LDI r2, 18
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
