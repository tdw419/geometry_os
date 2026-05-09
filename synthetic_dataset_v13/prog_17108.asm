; DESCRIPTION: Places a yellow 14x17 rectangle at position (177, 202).
; PLAN: r0=177(x), r1=202(y), r2=14(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 202
LDI r2, 14
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
