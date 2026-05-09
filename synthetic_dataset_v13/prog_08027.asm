; DESCRIPTION: Places a white 120x106 rectangle at position (353, 83).
; PLAN: r0=353(x), r1=83(y), r2=120(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 83
LDI r2, 120
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
