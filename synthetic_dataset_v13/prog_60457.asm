; DESCRIPTION: Places a yellow 112x113 rectangle at position (194, 133).
; PLAN: r0=194(x), r1=133(y), r2=112(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 133
LDI r2, 112
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
