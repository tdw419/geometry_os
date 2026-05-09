; DESCRIPTION: Renders a cyan box of size 48x72 starting at (49, 112).
; PLAN: r0=49(x), r1=112(y), r2=48(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 112
LDI r2, 48
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
