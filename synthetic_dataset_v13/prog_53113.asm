; DESCRIPTION: Renders a yellow box of size 33x86 starting at (298, 166).
; PLAN: r0=298(x), r1=166(y), r2=33(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 166
LDI r2, 33
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
