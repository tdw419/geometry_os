; DESCRIPTION: Places a yellow 111x110 rectangle at position (246, 133).
; PLAN: r0=246(x), r1=133(y), r2=111(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 133
LDI r2, 111
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
