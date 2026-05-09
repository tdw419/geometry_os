; DESCRIPTION: Places a white 112x10 rectangle at position (153, 244).
; PLAN: r0=153(x), r1=244(y), r2=112(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 244
LDI r2, 112
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
