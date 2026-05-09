; DESCRIPTION: Renders a red box of size 29x119 starting at (146, 82).
; PLAN: r0=146(x), r1=82(y), r2=29(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 82
LDI r2, 29
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
