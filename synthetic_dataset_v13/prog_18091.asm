; DESCRIPTION: Renders a red box of size 76x115 starting at (328, 17).
; PLAN: r0=328(x), r1=17(y), r2=76(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 17
LDI r2, 76
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
