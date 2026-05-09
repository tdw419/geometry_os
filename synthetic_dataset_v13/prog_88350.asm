; DESCRIPTION: Renders a green box of size 102x58 starting at (289, 21).
; PLAN: r0=289(x), r1=21(y), r2=102(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 21
LDI r2, 102
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
