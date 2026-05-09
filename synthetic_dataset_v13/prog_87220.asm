; DESCRIPTION: Renders a cyan box of size 77x49 starting at (14, 177).
; PLAN: r0=14(x), r1=177(y), r2=77(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 177
LDI r2, 77
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
