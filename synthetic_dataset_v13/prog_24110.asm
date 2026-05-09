; DESCRIPTION: Renders a cyan box of size 77x50 starting at (34, 109).
; PLAN: r0=34(x), r1=109(y), r2=77(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 109
LDI r2, 77
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
