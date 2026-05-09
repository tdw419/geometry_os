; DESCRIPTION: Renders a cyan box of size 91x81 starting at (222, 165).
; PLAN: r0=222(x), r1=165(y), r2=91(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 165
LDI r2, 91
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
