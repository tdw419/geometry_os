; DESCRIPTION: Places a green 15x96 rectangle at position (206, 21).
; PLAN: r0=206(x), r1=21(y), r2=15(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 21
LDI r2, 15
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
