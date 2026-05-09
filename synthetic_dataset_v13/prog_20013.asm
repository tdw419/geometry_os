; DESCRIPTION: Renders a yellow box of size 82x116 starting at (221, 38).
; PLAN: r0=221(x), r1=38(y), r2=82(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 38
LDI r2, 82
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
