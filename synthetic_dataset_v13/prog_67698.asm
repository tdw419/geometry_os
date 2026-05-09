; DESCRIPTION: Renders a red box of size 111x13 starting at (54, 192).
; PLAN: r0=54(x), r1=192(y), r2=111(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 192
LDI r2, 111
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
