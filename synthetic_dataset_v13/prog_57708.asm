; DESCRIPTION: Renders a red box of size 38x83 starting at (350, 61).
; PLAN: r0=350(x), r1=61(y), r2=38(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 61
LDI r2, 38
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
