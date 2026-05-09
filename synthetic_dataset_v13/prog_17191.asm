; DESCRIPTION: Places a green 46x11 rectangle at position (251, 126).
; PLAN: r0=251(x), r1=126(y), r2=46(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 126
LDI r2, 46
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
