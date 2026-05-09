; DESCRIPTION: Renders a red box of size 79x120 starting at (220, 105).
; PLAN: r0=220(x), r1=105(y), r2=79(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 105
LDI r2, 79
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
