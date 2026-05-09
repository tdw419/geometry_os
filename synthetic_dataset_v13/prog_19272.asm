; DESCRIPTION: Places a green 81x35 rectangle at position (221, 173).
; PLAN: r0=221(x), r1=173(y), r2=81(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 173
LDI r2, 81
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
