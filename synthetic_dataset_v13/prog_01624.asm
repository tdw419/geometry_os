; DESCRIPTION: Renders a green box of size 27x35 starting at (436, 60).
; PLAN: r0=436(x), r1=60(y), r2=27(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 60
LDI r2, 27
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
