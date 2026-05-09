; DESCRIPTION: Places a green 24x59 rectangle at position (116, 130).
; PLAN: r0=116(x), r1=130(y), r2=24(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 130
LDI r2, 24
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
