; DESCRIPTION: Renders a cyan box of size 85x46 starting at (161, 156).
; PLAN: r0=161(x), r1=156(y), r2=85(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 156
LDI r2, 85
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
