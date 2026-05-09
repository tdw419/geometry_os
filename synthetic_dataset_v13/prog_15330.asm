; DESCRIPTION: Renders a cyan box of size 48x49 starting at (261, 119).
; PLAN: r0=261(x), r1=119(y), r2=48(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 119
LDI r2, 48
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
