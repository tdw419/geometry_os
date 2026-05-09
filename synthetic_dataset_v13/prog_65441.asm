; DESCRIPTION: Renders a cyan box of size 48x76 starting at (2, 1).
; PLAN: r0=2(x), r1=1(y), r2=48(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 1
LDI r2, 48
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
