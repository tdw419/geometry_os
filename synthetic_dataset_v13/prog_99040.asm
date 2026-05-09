; DESCRIPTION: Places a white 71x12 rectangle at position (8, 169).
; PLAN: r0=8(x), r1=169(y), r2=71(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 169
LDI r2, 71
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
