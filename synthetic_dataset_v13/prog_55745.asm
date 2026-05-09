; DESCRIPTION: Renders a red box of size 107x20 starting at (171, 52).
; PLAN: r0=171(x), r1=52(y), r2=107(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 52
LDI r2, 107
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
