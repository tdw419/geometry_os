; DESCRIPTION: Places a white 54x47 rectangle at position (453, 54).
; PLAN: r0=453(x), r1=54(y), r2=54(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 54
LDI r2, 54
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
