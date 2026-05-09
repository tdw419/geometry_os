; DESCRIPTION: Places a yellow 14x46 rectangle at position (195, 207).
; PLAN: r0=195(x), r1=207(y), r2=14(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 207
LDI r2, 14
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
