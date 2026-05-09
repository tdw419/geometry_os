; DESCRIPTION: Places a white 44x10 rectangle at position (302, 11).
; PLAN: r0=302(x), r1=11(y), r2=44(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 11
LDI r2, 44
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
