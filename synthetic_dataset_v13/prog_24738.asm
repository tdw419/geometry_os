; DESCRIPTION: Places a red 38x10 rectangle at position (416, 150).
; PLAN: r0=416(x), r1=150(y), r2=38(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 150
LDI r2, 38
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
