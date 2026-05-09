; DESCRIPTION: Renders a cyan box of size 25x76 starting at (289, 33).
; PLAN: r0=289(x), r1=33(y), r2=25(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 33
LDI r2, 25
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
