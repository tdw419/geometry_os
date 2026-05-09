; DESCRIPTION: Places a white 24x86 rectangle at position (153, 130).
; PLAN: r0=153(x), r1=130(y), r2=24(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 130
LDI r2, 24
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
