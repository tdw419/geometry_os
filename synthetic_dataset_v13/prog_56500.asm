; DESCRIPTION: Renders a red box of size 120x82 starting at (66, 115).
; PLAN: r0=66(x), r1=115(y), r2=120(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 115
LDI r2, 120
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
