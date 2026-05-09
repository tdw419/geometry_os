; DESCRIPTION: Renders a red box of size 21x91 starting at (120, 54).
; PLAN: r0=120(x), r1=54(y), r2=21(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 54
LDI r2, 21
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
