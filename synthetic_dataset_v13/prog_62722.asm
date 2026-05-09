; DESCRIPTION: Places a blue 12x109 rectangle at position (290, 43).
; PLAN: r0=290(x), r1=43(y), r2=12(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 43
LDI r2, 12
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
