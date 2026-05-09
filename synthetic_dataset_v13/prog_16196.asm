; DESCRIPTION: Places a red 65x116 rectangle at position (435, 62).
; PLAN: r0=435(x), r1=62(y), r2=65(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 62
LDI r2, 65
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
