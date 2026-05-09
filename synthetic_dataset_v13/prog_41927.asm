; DESCRIPTION: Places a yellow 44x94 rectangle at position (277, 71).
; PLAN: r0=277(x), r1=71(y), r2=44(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 71
LDI r2, 44
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
