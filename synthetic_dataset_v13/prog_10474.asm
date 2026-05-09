; DESCRIPTION: Places a white 83x59 rectangle at position (277, 68).
; PLAN: r0=277(x), r1=68(y), r2=83(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 68
LDI r2, 83
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
