; DESCRIPTION: Places a green 59x54 rectangle at position (173, 130).
; PLAN: r0=173(x), r1=130(y), r2=59(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 130
LDI r2, 59
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
