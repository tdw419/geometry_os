; DESCRIPTION: Renders a red box of size 49x90 starting at (350, 94).
; PLAN: r0=350(x), r1=94(y), r2=49(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 94
LDI r2, 49
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
