; DESCRIPTION: Renders a red box of size 107x10 starting at (13, 220).
; PLAN: r0=13(x), r1=220(y), r2=107(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 220
LDI r2, 107
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
