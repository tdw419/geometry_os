; DESCRIPTION: Renders a yellow box of size 91x83 starting at (144, 154).
; PLAN: r0=144(x), r1=154(y), r2=91(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 154
LDI r2, 91
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
