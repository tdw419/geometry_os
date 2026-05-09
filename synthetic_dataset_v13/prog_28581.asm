; DESCRIPTION: Places a green 62x116 rectangle at position (129, 121).
; PLAN: r0=129(x), r1=121(y), r2=62(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 121
LDI r2, 62
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
