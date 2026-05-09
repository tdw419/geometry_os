; DESCRIPTION: Places a green 20x38 rectangle at position (280, 121).
; PLAN: r0=280(x), r1=121(y), r2=20(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 121
LDI r2, 20
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
