; DESCRIPTION: Renders a cyan box of size 110x46 starting at (144, 72).
; PLAN: r0=144(x), r1=72(y), r2=110(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 72
LDI r2, 110
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
