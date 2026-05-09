; DESCRIPTION: Renders a yellow box of size 98x74 starting at (313, 28).
; PLAN: r0=313(x), r1=28(y), r2=98(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 28
LDI r2, 98
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
