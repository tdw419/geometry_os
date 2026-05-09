; DESCRIPTION: Places a white 109x38 rectangle at position (274, 200).
; PLAN: r0=274(x), r1=200(y), r2=109(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 200
LDI r2, 109
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
