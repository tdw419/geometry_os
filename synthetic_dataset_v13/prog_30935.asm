; DESCRIPTION: Renders a red box of size 91x90 starting at (245, 94).
; PLAN: r0=245(x), r1=94(y), r2=91(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 94
LDI r2, 91
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
