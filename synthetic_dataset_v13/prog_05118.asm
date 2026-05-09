; DESCRIPTION: Renders a red box of size 48x104 starting at (405, 97).
; PLAN: r0=405(x), r1=97(y), r2=48(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 97
LDI r2, 48
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
