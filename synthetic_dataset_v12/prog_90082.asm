; DESCRIPTION: Places a green 14x52 rectangle at position (273, 59).
; PLAN: r0=273(x), r1=59(y), r2=14(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 59
LDI r2, 14
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
