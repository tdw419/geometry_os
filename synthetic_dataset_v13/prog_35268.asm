; DESCRIPTION: Renders a orange box of size 23x64 starting at (350, 147).
; PLAN: r0=350(x), r1=147(y), r2=23(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 147
LDI r2, 23
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
