; DESCRIPTION: Places a yellow 38x40 rectangle at position (290, 109).
; PLAN: r0=290(x), r1=109(y), r2=38(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 109
LDI r2, 38
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
