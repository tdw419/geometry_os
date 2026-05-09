; DESCRIPTION: Places a yellow 55x21 rectangle at position (73, 192).
; PLAN: r0=73(x), r1=192(y), r2=55(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 192
LDI r2, 55
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
