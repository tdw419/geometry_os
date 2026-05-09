; DESCRIPTION: Renders a red box of size 30x40 starting at (268, 192).
; PLAN: r0=268(x), r1=192(y), r2=30(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 192
LDI r2, 30
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
