; DESCRIPTION: Places a yellow 81x34 rectangle at position (33, 192).
; PLAN: r0=33(x), r1=192(y), r2=81(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 192
LDI r2, 81
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
