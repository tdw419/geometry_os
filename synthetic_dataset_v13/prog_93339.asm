; DESCRIPTION: Places a white 75x50 rectangle at position (71, 129).
; PLAN: r0=71(x), r1=129(y), r2=75(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 129
LDI r2, 75
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
