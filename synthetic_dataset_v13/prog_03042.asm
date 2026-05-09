; DESCRIPTION: Places a white 33x105 rectangle at position (450, 59).
; PLAN: r0=450(x), r1=59(y), r2=33(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 59
LDI r2, 33
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
