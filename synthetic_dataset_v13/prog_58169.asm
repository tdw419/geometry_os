; DESCRIPTION: Places a yellow 13x46 rectangle at position (440, 169).
; PLAN: r0=440(x), r1=169(y), r2=13(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 169
LDI r2, 13
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
