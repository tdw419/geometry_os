; DESCRIPTION: Renders a cyan box of size 35x95 starting at (407, 77).
; PLAN: r0=407(x), r1=77(y), r2=35(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 77
LDI r2, 35
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
