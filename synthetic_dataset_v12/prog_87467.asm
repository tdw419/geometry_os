; DESCRIPTION: Renders a yellow box of size 27x23 starting at (218, 43).
; PLAN: r0=218(x), r1=43(y), r2=27(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 43
LDI r2, 27
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
