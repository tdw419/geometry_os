; DESCRIPTION: Places a white 106x59 rectangle at position (40, 13).
; PLAN: r0=40(x), r1=13(y), r2=106(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 13
LDI r2, 106
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
