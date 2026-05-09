; DESCRIPTION: Places a yellow 80x109 rectangle at position (127, 76).
; PLAN: r0=127(x), r1=76(y), r2=80(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 76
LDI r2, 80
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
