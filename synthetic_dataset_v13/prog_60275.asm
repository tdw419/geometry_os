; DESCRIPTION: Places a white 33x19 rectangle at position (247, 169).
; PLAN: r0=247(x), r1=169(y), r2=33(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 169
LDI r2, 33
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
