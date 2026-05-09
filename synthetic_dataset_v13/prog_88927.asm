; DESCRIPTION: Renders a red box of size 57x48 starting at (266, 66).
; PLAN: r0=266(x), r1=66(y), r2=57(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 66
LDI r2, 57
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
