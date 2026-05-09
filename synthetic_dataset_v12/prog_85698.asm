; DESCRIPTION: Renders a green box of size 98x116 starting at (236, 65).
; PLAN: r0=236(x), r1=65(y), r2=98(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 65
LDI r2, 98
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
