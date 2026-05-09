; DESCRIPTION: Renders a yellow box of size 78x71 starting at (214, 113).
; PLAN: r0=214(x), r1=113(y), r2=78(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 113
LDI r2, 78
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
