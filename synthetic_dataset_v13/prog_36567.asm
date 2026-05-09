; DESCRIPTION: Renders a red box of size 19x36 starting at (298, 17).
; PLAN: r0=298(x), r1=17(y), r2=19(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 17
LDI r2, 19
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
