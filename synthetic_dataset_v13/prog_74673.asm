; DESCRIPTION: Renders a red box of size 83x73 starting at (16, 94).
; PLAN: r0=16(x), r1=94(y), r2=83(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 94
LDI r2, 83
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
