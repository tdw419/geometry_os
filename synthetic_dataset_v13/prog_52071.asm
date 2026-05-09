; DESCRIPTION: Renders a yellow box of size 112x77 starting at (276, 135).
; PLAN: r0=276(x), r1=135(y), r2=112(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 135
LDI r2, 112
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
