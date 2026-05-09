; DESCRIPTION: Places a white 112x54 rectangle at position (26, 174).
; PLAN: r0=26(x), r1=174(y), r2=112(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 174
LDI r2, 112
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
