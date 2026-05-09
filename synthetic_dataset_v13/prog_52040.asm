; DESCRIPTION: Renders a yellow box of size 94x116 starting at (368, 38).
; PLAN: r0=368(x), r1=38(y), r2=94(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 38
LDI r2, 94
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
