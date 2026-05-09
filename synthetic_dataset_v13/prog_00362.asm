; DESCRIPTION: Renders a red box of size 22x43 starting at (267, 152).
; PLAN: r0=267(x), r1=152(y), r2=22(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 152
LDI r2, 22
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
