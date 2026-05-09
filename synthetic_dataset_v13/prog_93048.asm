; DESCRIPTION: Places a white 38x87 rectangle at position (174, 47).
; PLAN: r0=174(x), r1=47(y), r2=38(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 47
LDI r2, 38
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
