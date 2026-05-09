; DESCRIPTION: Renders a cyan box of size 48x38 starting at (316, 22).
; PLAN: r0=316(x), r1=22(y), r2=48(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 22
LDI r2, 48
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
