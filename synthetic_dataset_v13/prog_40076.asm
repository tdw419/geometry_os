; DESCRIPTION: Renders a cyan box of size 30x88 starting at (378, 77).
; PLAN: r0=378(x), r1=77(y), r2=30(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 77
LDI r2, 30
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
