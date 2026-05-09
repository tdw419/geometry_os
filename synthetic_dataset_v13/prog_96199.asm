; DESCRIPTION: Renders a yellow box of size 27x77 starting at (209, 127).
; PLAN: r0=209(x), r1=127(y), r2=27(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 127
LDI r2, 27
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
