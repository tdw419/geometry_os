; DESCRIPTION: Places a green 27x24 rectangle at position (465, 130).
; PLAN: r0=465(x), r1=130(y), r2=27(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 130
LDI r2, 27
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
