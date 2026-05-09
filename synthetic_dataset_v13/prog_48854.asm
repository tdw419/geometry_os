; DESCRIPTION: Places a yellow 56x21 rectangle at position (80, 46).
; PLAN: r0=80(x), r1=46(y), r2=56(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 46
LDI r2, 56
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
