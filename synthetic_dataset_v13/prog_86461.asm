; DESCRIPTION: Places a green 24x109 rectangle at position (462, 28).
; PLAN: r0=462(x), r1=28(y), r2=24(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 28
LDI r2, 24
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
