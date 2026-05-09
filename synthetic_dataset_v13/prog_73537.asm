; DESCRIPTION: Renders a red box of size 83x86 starting at (227, 152).
; PLAN: r0=227(x), r1=152(y), r2=83(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 152
LDI r2, 83
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
