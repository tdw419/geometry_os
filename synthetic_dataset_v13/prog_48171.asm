; DESCRIPTION: Places a white 87x106 rectangle at position (243, 83).
; PLAN: r0=243(x), r1=83(y), r2=87(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 83
LDI r2, 87
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
