; DESCRIPTION: Renders a red box of size 104x105 starting at (48, 19).
; PLAN: r0=48(x), r1=19(y), r2=104(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 19
LDI r2, 104
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
