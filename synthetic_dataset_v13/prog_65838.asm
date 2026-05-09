; DESCRIPTION: Renders a orange box of size 112x47 starting at (28, 192).
; PLAN: r0=28(x), r1=192(y), r2=112(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 192
LDI r2, 112
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
