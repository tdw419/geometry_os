; DESCRIPTION: Places a white 38x106 rectangle at position (444, 33).
; PLAN: r0=444(x), r1=33(y), r2=38(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 33
LDI r2, 38
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
