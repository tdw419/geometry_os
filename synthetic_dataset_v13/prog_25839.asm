; DESCRIPTION: Places a yellow 65x94 rectangle at position (241, 46).
; PLAN: r0=241(x), r1=46(y), r2=65(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 46
LDI r2, 65
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
