; DESCRIPTION: Renders a red box of size 108x111 starting at (384, 93).
; PLAN: r0=384(x), r1=93(y), r2=108(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 93
LDI r2, 108
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
