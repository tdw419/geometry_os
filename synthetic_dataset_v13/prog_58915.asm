; DESCRIPTION: Places a green 74x33 rectangle at position (434, 14).
; PLAN: r0=434(x), r1=14(y), r2=74(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 14
LDI r2, 74
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
