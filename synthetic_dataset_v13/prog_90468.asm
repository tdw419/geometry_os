; DESCRIPTION: Renders a red box of size 87x80 starting at (135, 65).
; PLAN: r0=135(x), r1=65(y), r2=87(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 65
LDI r2, 87
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
