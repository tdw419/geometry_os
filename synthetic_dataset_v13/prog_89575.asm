; DESCRIPTION: Renders a green box of size 45x96 starting at (202, 0).
; PLAN: r0=202(x), r1=0(y), r2=45(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 0
LDI r2, 45
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
