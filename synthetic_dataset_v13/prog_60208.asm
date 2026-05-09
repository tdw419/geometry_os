; DESCRIPTION: Renders a red box of size 21x66 starting at (166, 14).
; PLAN: r0=166(x), r1=14(y), r2=21(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 14
LDI r2, 21
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
