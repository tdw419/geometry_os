; DESCRIPTION: Places a white 48x17 rectangle at position (302, 130).
; PLAN: r0=302(x), r1=130(y), r2=48(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 130
LDI r2, 48
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
