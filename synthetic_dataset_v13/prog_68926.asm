; DESCRIPTION: Places a red 106x21 rectangle at position (200, 34).
; PLAN: r0=200(x), r1=34(y), r2=106(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 34
LDI r2, 106
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
