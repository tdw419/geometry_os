; DESCRIPTION: Renders a cyan box of size 34x46 starting at (76, 137).
; PLAN: r0=76(x), r1=137(y), r2=34(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 137
LDI r2, 34
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
