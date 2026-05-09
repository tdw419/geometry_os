; DESCRIPTION: Places a yellow 71x46 rectangle at position (170, 197).
; PLAN: r0=170(x), r1=197(y), r2=71(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 197
LDI r2, 71
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
