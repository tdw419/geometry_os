; DESCRIPTION: Places a white 90x60 rectangle at position (80, 130).
; PLAN: r0=80(x), r1=130(y), r2=90(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 130
LDI r2, 90
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
