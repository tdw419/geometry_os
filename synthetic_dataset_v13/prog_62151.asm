; DESCRIPTION: Renders a cyan box of size 85x34 starting at (356, 10).
; PLAN: r0=356(x), r1=10(y), r2=85(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 10
LDI r2, 85
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
