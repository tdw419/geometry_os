; DESCRIPTION: Places a yellow 30x65 rectangle at position (444, 27).
; PLAN: r0=444(x), r1=27(y), r2=30(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 27
LDI r2, 30
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
