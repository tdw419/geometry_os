; DESCRIPTION: Renders a red box of size 47x45 starting at (260, 2).
; PLAN: r0=260(x), r1=2(y), r2=47(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 2
LDI r2, 47
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
