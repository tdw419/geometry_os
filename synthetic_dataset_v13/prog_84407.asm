; DESCRIPTION: Renders a yellow box of size 94x64 starting at (283, 47).
; PLAN: r0=283(x), r1=47(y), r2=94(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 47
LDI r2, 94
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
