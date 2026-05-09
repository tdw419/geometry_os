; DESCRIPTION: Renders a cyan box of size 46x76 starting at (466, 147).
; PLAN: r0=466(x), r1=147(y), r2=46(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 147
LDI r2, 46
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
