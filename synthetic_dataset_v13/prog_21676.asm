; DESCRIPTION: Places a red 74x25 rectangle at position (416, 59).
; PLAN: r0=416(x), r1=59(y), r2=74(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 59
LDI r2, 74
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
