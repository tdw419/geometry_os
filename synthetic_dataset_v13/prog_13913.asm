; DESCRIPTION: Renders a red box of size 10x37 starting at (328, 198).
; PLAN: r0=328(x), r1=198(y), r2=10(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 198
LDI r2, 10
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
