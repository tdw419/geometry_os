; DESCRIPTION: Places a yellow 28x91 rectangle at position (323, 46).
; PLAN: r0=323(x), r1=46(y), r2=28(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 46
LDI r2, 28
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
