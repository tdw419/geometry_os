; DESCRIPTION: Renders a cyan box of size 112x85 starting at (336, 123).
; PLAN: r0=336(x), r1=123(y), r2=112(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 123
LDI r2, 112
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
