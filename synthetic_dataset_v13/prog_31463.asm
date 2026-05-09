; DESCRIPTION: Renders a black box of size 17x43 starting at (152, 154).
; PLAN: r0=152(x), r1=154(y), r2=17(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 154
LDI r2, 17
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
