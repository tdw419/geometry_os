; DESCRIPTION: Places a yellow 109x27 rectangle at position (208, 34).
; PLAN: r0=208(x), r1=34(y), r2=109(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 34
LDI r2, 109
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
