; DESCRIPTION: Renders a yellow box of size 38x77 starting at (177, 166).
; PLAN: r0=177(x), r1=166(y), r2=38(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 166
LDI r2, 38
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
