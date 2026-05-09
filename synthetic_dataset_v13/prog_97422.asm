; DESCRIPTION: Places a yellow 41x44 rectangle at position (30, 192).
; PLAN: r0=30(x), r1=192(y), r2=41(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 192
LDI r2, 41
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
