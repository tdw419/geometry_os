; DESCRIPTION: Renders a cyan box of size 100x14 starting at (328, 45).
; PLAN: r0=328(x), r1=45(y), r2=100(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 45
LDI r2, 100
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
