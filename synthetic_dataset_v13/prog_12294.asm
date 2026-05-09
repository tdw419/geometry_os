; DESCRIPTION: Renders a cyan box of size 31x52 starting at (189, 162).
; PLAN: r0=189(x), r1=162(y), r2=31(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 162
LDI r2, 31
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
