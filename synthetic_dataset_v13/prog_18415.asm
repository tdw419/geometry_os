; DESCRIPTION: Places a yellow 15x36 rectangle at position (461, 192).
; PLAN: r0=461(x), r1=192(y), r2=15(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 192
LDI r2, 15
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
