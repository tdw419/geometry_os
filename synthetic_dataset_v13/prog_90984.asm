; DESCRIPTION: Places a white 90x65 rectangle at position (59, 24).
; PLAN: r0=59(x), r1=24(y), r2=90(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 24
LDI r2, 90
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
