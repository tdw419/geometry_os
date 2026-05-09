; DESCRIPTION: Renders a yellow box of size 73x90 starting at (298, 29).
; PLAN: r0=298(x), r1=29(y), r2=73(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 29
LDI r2, 73
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
