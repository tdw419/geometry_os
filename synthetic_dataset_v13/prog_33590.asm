; DESCRIPTION: Places a white 109x46 rectangle at position (282, 129).
; PLAN: r0=282(x), r1=129(y), r2=109(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 129
LDI r2, 109
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
