; DESCRIPTION: Places a green 72x52 rectangle at position (194, 29).
; PLAN: r0=194(x), r1=29(y), r2=72(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 29
LDI r2, 72
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
