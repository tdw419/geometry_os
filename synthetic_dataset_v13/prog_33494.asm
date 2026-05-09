; DESCRIPTION: Places a yellow 106x105 rectangle at position (367, 26).
; PLAN: r0=367(x), r1=26(y), r2=106(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 26
LDI r2, 106
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
