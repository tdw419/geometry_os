; DESCRIPTION: Places a green 24x13 rectangle at position (27, 107).
; PLAN: r0=27(x), r1=107(y), r2=24(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 107
LDI r2, 24
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
