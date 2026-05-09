; DESCRIPTION: Renders a magenta box of size 33x72 starting at (443, 184).
; PLAN: r0=443(x), r1=184(y), r2=33(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 184
LDI r2, 33
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
