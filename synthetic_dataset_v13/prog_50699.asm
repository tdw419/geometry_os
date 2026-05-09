; DESCRIPTION: Renders a green box of size 120x78 starting at (384, 165).
; PLAN: r0=384(x), r1=165(y), r2=120(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 165
LDI r2, 120
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
