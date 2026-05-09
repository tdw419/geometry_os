; DESCRIPTION: Places a green 22x24 rectangle at position (369, 192).
; PLAN: r0=369(x), r1=192(y), r2=22(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 192
LDI r2, 22
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
