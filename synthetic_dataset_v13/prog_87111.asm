; DESCRIPTION: Renders a green box of size 34x92 starting at (334, 120).
; PLAN: r0=334(x), r1=120(y), r2=34(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 120
LDI r2, 34
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
