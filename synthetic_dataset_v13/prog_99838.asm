; DESCRIPTION: Renders a red box of size 113x63 starting at (93, 174).
; PLAN: r0=93(x), r1=174(y), r2=113(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 174
LDI r2, 113
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
