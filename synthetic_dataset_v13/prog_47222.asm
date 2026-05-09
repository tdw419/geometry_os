; DESCRIPTION: Places a white 36x38 rectangle at position (416, 65).
; PLAN: r0=416(x), r1=65(y), r2=36(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 65
LDI r2, 36
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
