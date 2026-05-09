; DESCRIPTION: Renders a cyan box of size 34x12 starting at (12, 7).
; PLAN: r0=12(x), r1=7(y), r2=34(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 7
LDI r2, 34
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
