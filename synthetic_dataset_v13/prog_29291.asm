; DESCRIPTION: Renders a yellow box of size 48x87 starting at (344, 165).
; PLAN: r0=344(x), r1=165(y), r2=48(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 165
LDI r2, 48
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
