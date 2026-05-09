; DESCRIPTION: Renders a yellow box of size 79x64 starting at (148, 192).
; PLAN: r0=148(x), r1=192(y), r2=79(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 192
LDI r2, 79
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
