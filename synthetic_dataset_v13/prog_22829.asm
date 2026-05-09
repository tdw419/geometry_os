; DESCRIPTION: Renders a magenta box of size 117x95 starting at (17, 126).
; PLAN: r0=17(x), r1=126(y), r2=117(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 126
LDI r2, 117
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
