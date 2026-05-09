; DESCRIPTION: Renders a red box of size 57x48 starting at (300, 55).
; PLAN: r0=300(x), r1=55(y), r2=57(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 55
LDI r2, 57
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
