; DESCRIPTION: Renders a cyan box of size 11x61 starting at (495, 121).
; PLAN: r0=495(x), r1=121(y), r2=11(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 121
LDI r2, 11
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
