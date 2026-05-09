; DESCRIPTION: Renders a yellow box of size 114x116 starting at (248, 55).
; PLAN: r0=248(x), r1=55(y), r2=114(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 55
LDI r2, 114
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
