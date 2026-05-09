; DESCRIPTION: Places a yellow 102x48 rectangle at position (208, 138).
; PLAN: r0=208(x), r1=138(y), r2=102(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 138
LDI r2, 102
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
