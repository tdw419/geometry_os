; DESCRIPTION: Renders a black box of size 55x26 starting at (63, 152).
; PLAN: r0=63(x), r1=152(y), r2=55(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 152
LDI r2, 55
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
