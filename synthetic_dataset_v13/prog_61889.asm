; DESCRIPTION: Renders a red box of size 90x94 starting at (417, 34).
; PLAN: r0=417(x), r1=34(y), r2=90(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 34
LDI r2, 90
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
