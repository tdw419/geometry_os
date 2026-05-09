; DESCRIPTION: Renders a yellow box of size 111x54 starting at (182, 124).
; PLAN: r0=182(x), r1=124(y), r2=111(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 124
LDI r2, 111
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
