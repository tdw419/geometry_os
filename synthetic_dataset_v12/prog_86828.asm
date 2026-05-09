; DESCRIPTION: Places a white 59x28 rectangle at position (54, 65).
; PLAN: r0=54(x), r1=65(y), r2=59(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 65
LDI r2, 59
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
